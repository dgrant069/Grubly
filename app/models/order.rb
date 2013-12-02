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
      check_each_dish(item, @order)
      item.update(:inventory => item.inventory)
    end
  end

  def check_each_dish(item, order)
    @item = item
    @order = order

    end_inventory = @item.inventory
    @order.ordered_items.each do |ordered_item|
      if ordered_item.item_id == @item.id
        end_inventory = (@item.inventory - ordered_item.quantity)
      else
        end_inventory = @item.inventory
      end
      @item.inventory = end_inventory
    end
  end

  def inventory_check_before_deletion(order, restaurant)
    @order = order
    @restaurant = restaurant

    @restaurant.items.each do |item|
      check_each_dish_before_deletion(item, @order)
      item.update(:inventory => item.inventory)
    end
  end

  def check_each_dish_before_deletion(item, order)
    @item = item
    @order = order

    end_inventory = @item.inventory
    @order.ordered_items.each do |ordered_item|
      if ordered_item.item_id == @item.id
        end_inventory = (@item.inventory + ordered_item.quantity)
      else
        end_inventory = @item.inventory
      end
      @item.inventory = end_inventory
    end
  end

end
