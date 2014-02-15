class Item
  include Mongoid::Document


  has_and_belongs_to_many :orders

  field :name, type: String
  field :category, type: String
  field :price, type: Float

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  validates :price, presence: true

end

