class Item < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :ordered_item
end
