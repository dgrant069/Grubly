class Item < ActiveRecord::Base
  belongs_to :restaurant
  has_many :orders, through: :ordered_item
end
