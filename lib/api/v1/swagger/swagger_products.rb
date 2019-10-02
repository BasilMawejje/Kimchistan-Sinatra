require 'json'
require 'swagger/blocks'

class SwaggerProducts
  include Swagger::Blocks

  swagger_path '/products' do
    operation :get do
      key :description, 'Returns all products'
      key :operationId, 'getProducts'
      key :produces, ['application/json']
      response 200 do
        key :description, 'products response'
        schema type: :array do
          items do
            key :'$ref', :Product
          end
        end
      end
    end
  end
end
