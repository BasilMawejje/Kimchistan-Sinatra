require 'dotenv/load'

Aws.config.update({
  region:      ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(ENV['ACCESS_KEY'], ENV['SECRET_KEY'])
})

sqs = Aws::SQS::Client.new(
  region:      ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(ENV['ACCESS_KEY'], ENV['SECRET_KEY'])
)
sqs.create_queue({queue_name: 'order_details'})
