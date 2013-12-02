class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_many :ordered_items
  has_many :items, through: :ordered_items
  accepts_nested_attributes_for :ordered_items, allow_destroy: true

  def inventory_check(order, restaurant)
    @order = order
    @restaurant = restaurant
    @restaurant.items.each do |item|
      end_inventory = item.inventory
      @order.ordered_items.each do |ordered_item|
        if ordered_item.item_id == item.id
          end_inventory = (item.inventory - ordered_item.quantity)
        end
      end
      item.inventory = end_inventory
      item.update(:inventory => item.inventory)
    end
  end

end
