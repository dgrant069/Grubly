class Item < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :item_ordered
end
