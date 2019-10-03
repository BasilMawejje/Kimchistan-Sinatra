require 'pony'
require 'spec_helper'
require './workers/mail_worker.rb'
require 'mail'

RSpec.describe 'Order details mailer' do
  Mail.defaults do
    delivery_method :test
  end

  it "should send no email when initialised" do
    expect(Mail::TestMailer.deliveries.length).to eq 0
  end

  it "should send an email to a make an order" do
    Mail.deliver do
      to 'mikel@christiansen.com'
      from 'sample@mail.com'
      subject 'Sample subject'
      body 'Sample body'
    end

    expect(Mail::TestMailer.deliveries.length).to eq 1
  end

  it "should sends multiple order emails" do
    Mail.deliver do
      to 'mikel@christiansen.com'
      from 'sample@mail.com'
      subject 'Sample subject'
      body 'Sample body'
    end

    Mail.deliver do
      to 'raoul@diffouo@mail.com'
      from 'sample@mail.com'
      subject 'Sample subject'
      body 'Sample body'
    end

    expect(Mail::TestMailer.deliveries.length).to eq 3
  end
end
