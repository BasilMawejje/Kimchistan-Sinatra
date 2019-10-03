require 'spec_helper'
require 'rack/test'
require './lib/api/v1/app.rb'
require 'factory_bot_rails'
require './spec/factories/product'
require './spec/support/database_cleaner'

RSpec.describe 'KimchsitanSinatra' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'GET /v1/products' do
    context 'return 1 product' do
      FactoryBot.create(:product)
      it 'should return a product' do
        get '/api/v1/products'

        expect(last_response).to be_ok
        expect(last_response.status).to eq 200
      end
    end
  end

  describe 'POST /v1/products' do
    context 'post a product' do
      it 'should post an invalid product' do
        post '/api/v1/products'

        expect(last_response.status).to eq 400
        expect(last_response.body).to eq "{\"message\":\"Invalid JSON\"}"
      end

      it 'should post a valid product' do
        product = { id: "5d8c744bf522cc0b35e9bf5a", name: "chicken", description: "desc", price: 10.0 }
        post '/api/v1/products',
        product.to_json,
        "CONTENT_TYPE" => "application/json"

        expect(last_response.status).to eq 201
        expect(last_response.body).to eq "{\"id\":\"5d8c744bf522cc0b35e9bf5a\",\"name\":\"chicken\",\"description\":\"desc\",\"price\":10.0}"
      end
    end
  end

  describe 'DELETE /v1/products/:id' do
    it "should delete a product" do
      product = { id: "5d8c744bf522cc0b35e9bf5a", name: "chicken", description: "desc", price: 10.0 }
      delete "/api/v1/products/#{product[:id]}"

      expect(last_response.status).to eq 204
    end
  end
end
