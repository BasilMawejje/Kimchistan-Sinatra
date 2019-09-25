require 'spec_helper'
require 'rack/test'
require './lib/api/v1/app.rb'
require 'factory_bot_rails'
require './spec/factories/product'
require './spec/support/database_cleaner'

RSpec.describe 'hello app' do
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
end