require './lib/api/v1/app'
require 'factory_bot_rails'
require './spec/factories/product'

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

  #   it "does not return unavailable dishes" do
  #     expect(Product.dishes).to_not include(Product.where("available = false"))
  #   end
  #
  #   it "should have a salads named scope that returns salads" do
  #     expect(Product.salads.count).to be(5)
  #   end
  #
  #   it "does not return unavailable salads" do
  #     expect(Product.salads).to_not include(Product.where("available = false"))
  #   end
  #
  #   it "should have a drinks named scope that returns drinks" do
  #     expect(Product.drinks.count).to be(5)
  #   end
  #
  #   it "does not return unavailable drinks" do
  #     expect(Product.drinks).to_not include(Product.where("available = false"))
  #   end
  # end
  #
  # describe 'associations' do
  #   it {is_expected.to have_and_belong_to_many(:ingredients)}
  # end
  end
end
