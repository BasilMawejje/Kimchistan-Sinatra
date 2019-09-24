require './lib/api/v1/app'
require 'factory_bot_rails'
require './spec/factories/product'
require './spec/support/database_cleaner'

RSpec.describe Ingredient, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps.for(:creating) }
	it { is_expected.to have_timestamps.for(:updating) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:available) }

  it { is_expected.to have_field(:name).of_type(String) }
  it { is_expected.to have_field(:available).of_type(Mongoid::Boolean) }
end
