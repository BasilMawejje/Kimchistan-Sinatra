require 'shoryuken'
require 'pony'
require 'spec_helper'
require './workers/mail_worker.rb'

RSpec.describe MailWorker do
  let(:sqs_msg) { double message_id: 'fc754df7-9cc2-4c41-96ca-5996a44b771e' }

  describe '#perform' do
    subject { MailWorker.new }

    it 'prints the body message' do
      expect { subject.perform(sqs_msg) }.to output('').to_stdout
    end

    it 'sends a new order email' do
      sqs_queue = double 'other queue'

      allow(Shoryuken::Client).to receive(:queues).
        with('other_queue').and_return(sqs_queue)

      expect(sqs_queue).to receive(:send_message)
      sqs_queue.send_message
      subject.perform(sqs_msg)
    end
  end
end
