# Models
class Ingredient
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :available, type: Boolean

  validates :name, presence: true
  validates :available, presence: true

  index({ name: 'text' })

  embedded_in :product
end
