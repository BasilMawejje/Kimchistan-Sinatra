require './lib/api/v1/app'
require 'factory_bot_rails'
require './spec/factories/product'
require './spec/support/database_cleaner'

RSpec.describe Product, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps.for(:creating) }
	it { is_expected.to have_timestamps.for(:updating) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:price) }

  it { is_expected.to have_field(:name).of_type(String) }
  it { is_expected.to have_field(:description).of_type(String) }
  it { is_expected.to have_field(:price).of_type(Float) }

  describe 'Scopes' do
    before do
      5.times do
        FactoryBot.create(:product)
      end
    end


    it "should have 5 products" do
      expect(Product.count).to be(5)
    end
  end
end
