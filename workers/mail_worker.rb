require 'shoryuken'

class MailWorker
  include Shoryuken::Worker
  shoryuken_options queue: 'order_details', auto_delete: true

  def order_details
    pickup_time = (Time.now + 30*60).strftime("%H:%M")
    Pony.mail to: 'basil.mawejje@gmail.com',
              from: 'noreply@kimchistan.com',
              subject: "Your order has been received.",
              body: "Your order has been received, pick your food at #{pickup_time}!"
  end

  def perform(sqs_msg)
    order_details
  end
end
