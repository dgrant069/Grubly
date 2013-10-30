class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
<<<<<<< HEAD
  has_many :items_ordereds
=======
  has_many :ordered_items
>>>>>>> f5d57e93cfaee9f09d46ebffc4f8c6bade9cffc7
end
