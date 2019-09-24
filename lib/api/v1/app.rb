require 'sinatra'
require 'sinatra/namespace'
require 'mongoid'
require './lib/api/v1/controllers/products_controller.rb'
require './lib/api/v1/models/product.rb'
require './lib/api/v1/serializers/product_serializer.rb'

# DB Setup
configure do
  Mongoid.load!("./mongoid.yml")
end
