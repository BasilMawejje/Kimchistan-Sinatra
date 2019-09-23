require 'sinatra'
require 'sinatra/namespace'
require 'mongoid'

# DB Setup
configure do
  Mongoid.load!("./mongoid.yml")
end

# Models
class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :price, type: Float

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  index({ name: 'text' })

  scope :name, -> (name) { where(name: /^#{name}/) }
end

# Serializers
class ProductSerializer
  def initialize(product)
    @product = product
  end

  def as_json(*)
    data = {
      id:@product.id.to_s,
      name:@product.name,
      description:@product.description,
      price:@product.price
    }
    data[:errors] = @product.errors if@product.errors.any?
    data
  end
end

# Endpoints
get '/' do
  'Welcome to Products page!'
end

namespace '/api/v1' do
  before do
    content_type 'application/json'
  end

  helpers do
    def base_url
      @base_url ||= "#{request.env['rack.url_scheme']}://{request.env['HTTP_HOST']}"
    end

    def json_params
      begin
        JSON.parse(request.body.read)
      rescue
        halt 400, { message:'Invalid JSON' }.to_json
      end
    end
  end

  get '/products' do
    products = Product.all
    %i[name description price].each do |filter|
      products = products.send(filter, params[filter]) if params[filter]
    end

    products.map {|product| ProductSerializer.new(product)}.to_json
  end

  get '/products/:id' do |id|
    product = Product.where(id: id).first
    halt(404, {message: 'Product not found'}.to_json) unless product
    ProductSerializer.new(product).to_json
  end

  post '/products ' do
    product = Product.new(json_params)
    if product.save
      response.headers['Location'] = "#{base_url}/api/v1/products/#{product.id}"
      status 201
    else
      status 422
      body ProductSerializer.new(product).to_json
    end
  end
end
