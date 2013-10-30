class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_many :items_ordereds
end
