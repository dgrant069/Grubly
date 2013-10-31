class OrderedItemsController < ApplicationController
  before_filter :load_order

def new
  @ordered_item = @order.ordered_items.new
  @items = @restaurant.items
end

def create
  @ordered_item = @order.ordered_items.new(ordered_item_params)

  if @ordered_item.save
      redirect_to restaurant_orders_url, notice: 'Order was successfully created.'
    else
      render action: 'new'
    end
end

private

  def load_order
    @restaurant = Restaurant.find(params[:restaurant_id])
    @order = @restaurant.orders.find(params[:order_id])
  end

  def ordered_item_params
    params.require(:ordered_item).permit(:item_id, :quantity, :note, :restaurant_id,
        :user_id)
  end
end
