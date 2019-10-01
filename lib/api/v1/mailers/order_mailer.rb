require 'pony'
require 'dotenv/load'

post '/orders' do
  Pony.mail to: 'basil.mawejje@gmail.com',
            from: 'noreply@kimchistan.com',
            subject: "Your order has been received.",
            body: "Your order has been received, pick your food at #{(Time.now + 30*60).strftime("%H:%M")}!"
end
