require 'sinatra'
require 'sinatra/namespace'
require 'mongoid'
require 'sinatra/reloader' if development?
Dir["./lib/api/v1/**/*.rb"].each { |file|
  require file
}
require './workers/mail_worker.rb'
require 'dotenv/load'

# DB Setup
configure do
  Mongoid.load!("./config/mongoid.yml")
end
