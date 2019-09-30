desc 'Print routes used in contoller files'
task :routes do
  puts File.open('./lib/api/v1/controllers/products_controller.rb').grep(/ get | post | delete/)
  puts File.open('./lib/api/v1/controllers/ingredients_controller.rb').grep(/ get | post | delete/)
end
