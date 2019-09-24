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

  delete '/products/:id' do |id|
    product.destroy if product
    status 204
  end
end
