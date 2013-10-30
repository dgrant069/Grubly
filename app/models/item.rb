class Item < ActiveRecord::Base
  belongs_to :restaurant
  has_many :ordered_items
  has_many :orders, through: :ordered_items
end
