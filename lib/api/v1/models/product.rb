class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :price, type: Float

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  index({ name: 'text' })

  # scope :name, -> (name) { where(name: /^#{name}/) }

  embeds_many :ingredients
end
