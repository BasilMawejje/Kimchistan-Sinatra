desc 'Print routes used in contoller files'
task :routes do
  puts 'Namespaces: '
  puts Dir.glob('./lib/api/**').grep(/v/)
  puts 'Routes: '
  puts Dir.glob('./lib/api/v1/controllers/*.rb').map{|x| x.split.map{|k| File.open(k)
                                                .grep(/ get | post | delete /) }}

end
