require 'pony'

post '/orders' do
  MailWorker.perform_async
end
