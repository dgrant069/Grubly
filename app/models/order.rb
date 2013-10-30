class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_many :items, through: :ordered_item

  attr_accessor :item_to_be_added
end
