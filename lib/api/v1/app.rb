require 'sinatra'
require 'sinatra/namespace'
require 'mongoid'
require './lib/api/v1/helpers/application_helper.rb'
require './lib/api/v1/controllers/products_controller.rb'
require './lib/api/v1/controllers/ingredients_controller.rb'
require './lib/api/v1/models/product.rb'
require './lib/api/v1/models/ingredient.rb'
require './lib/api/v1/serializers/product_serializer.rb'
require './lib/api/v1/serializers/ingredient_serializer.rb'

# DB Setup
configure do
  Mongoid.load!("./config/mongoid.yml")
end
