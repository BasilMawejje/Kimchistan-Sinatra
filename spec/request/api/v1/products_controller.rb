require './lib/api/v1/app'
require 'factory_bot_rails'
require './spec/factories/product'
require './spec/support/database_cleaner'

RSpec.describe Product, type: :controller do
  let!(:product) {FactoryBot.create(:product, name: 'Sample product',description: 'boring product',price: 10)}

  describe 'Get api/v1/products' do

    it 'returns collection of products' do

      get '/api/v1/products'

      expected_response = {'products' =>
                               [{'id' => product.id,
                                 'name' => 'prod',
                                 'price' => 10,
                                 'description' => 'desc'}]}


      expect(response.status).to eq 200
      expect(response_json).to eq expected_response
    end
  end
end
