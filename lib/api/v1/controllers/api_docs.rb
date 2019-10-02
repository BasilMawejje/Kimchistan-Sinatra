require 'swagger/blocks'
require 'sinatra'
require 'json'
require './lib/api/v1/swagger/swagger_products.rb'

class ApiDocs < Sinatra::Application
  include Swagger::Blocks

  before do
    content_type 'application/json'
  end

  swagger_root host: 'localhost' do
    key :swagger, '2.0'
    info version: '1.0.0' do
      key :title, 'Kimchistan-Sinatra'
      key :description, 'Kimchistan API rewritten in Sinatra'
      key :termsOfService, ''
      contact do
        key :name, 'Kimchistan-Sinatra'
      end
      license do
        key :name, 'MIT'
      end
    end
    key :basePath, './lib/api'
    key :schemes, ['http']
    key :consumes, ['application/json']
    key :produces, ['application/json']
    externalDocs description: 'Find more info here' do
      key :url, 'https://swagger.io'
    end
    tag name: 'product' do
      key :description, 'Products'
      externalDocs description: 'Find more info here' do
        key :url, 'https://swagger.io'
      end
    end
  end

  SWAGGERED_CLASSES = [
    SwaggerProducts,
    self,
  ].freeze

  get '/apidocs' do
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
