class OrderedItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order

  def inventory_check(ordered_item, restaurant, old_quantity)
    @ordered_item = ordered_item
    @restaurant = restaurant
    @old_quantity = old_quantity

    item = @restaurant.items.find(@ordered_item.item_id)
    end_quantity = @ordered_item.quantity - @old_quantity
    end_result = (item.inventory - end_quantity)
    item.inventory = end_result
    item.update(:inventory => item.inventory)
  end

  def creation_check(ordered_item, restaurant)
    @ordered_item = ordered_item
    @restaurant = restaurant

    item = @restaurant.items.find(@ordered_item.item_id)
    end_inventory = item.inventory - @ordered_item.quantity
    item.inventory = end_inventory
    item.update(:inventory => item.inventory)
  end

  def deletion_check(ordered_item, restaurant)
    @ordered_item = ordered_item
    @restaurant = restaurant

    item = @restaurant.items.find(@ordered_item.item_id)
    end_inventory = item.inventory + @ordered_item.quantity
    item.inventory = end_inventory
    item.update(:inventory => item.inventory)
  end

end
