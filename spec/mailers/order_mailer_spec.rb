require 'pony'
require 'spec_helper'
require './workers/mail_worker.rb'
require 'mail'

Mail.defaults do
  delivery_method :test
end

RSpec.describe 'Order details mailer' do
  describe 'sending an email' do
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

  describe 'ensure email is correctly sent' do
    include Mail::Matchers

    before(:each) do
      Mail::TestMailer.deliveries.clear

      Mail.deliver do
        to ['mikel@chriatiansen.com', 'raoul@diffouo.com']
        from 'sample@mail.com'
        subject 'Sample subject'
        body 'Sample body'
      end
    end

    it { is_expected.to have_sent_email }
    it { is_expected.to have_sent_email.from('sample@mail.com') }
    it { is_expected.to have_sent_email.to(['mikel@chriatiansen.com', 'raoul@diffouo.com']) }
    it { is_expected.to have_sent_email.with_subject('Sample subject') }
    it { is_expected.to have_sent_email.with_body('Sample body') }
    it { is_expected.to have_sent_email.with_no_attachments }
  end
end
