desc 'Print routes used in contoller files'
task :routes do
  puts 'Namespaces: '
  puts Dir.glob('./lib/api/**').grep(/v/)
  puts 'Routes: '
  puts Dir.glob('./lib/api/v1/controllers/*.rb').map{|x| x.split.map{|k| File.open(k)
                                                .grep(/ get | post | delete /) }}

end

desc 'populate database with dummy data'
namespace :db do
  task :populate do
    require './lib/api/v1/app.rb'
    require 'mongoid'
    product = { name: "sample", description: "sample desc", price: 10.0 }
    25.times do
      Product.create(product)
    end
    puts "#{Product.count} products currently in the database"
  end
end
