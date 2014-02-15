class Order
  include Mongoid::Document

	  has_and_belongs_to_many :items

	  field :name, type: String

	  validates :name, presence: true

    def total
      @total = []
      items.each do |i|
        @total << i.price
      end
      return @total.sum
    end

end

