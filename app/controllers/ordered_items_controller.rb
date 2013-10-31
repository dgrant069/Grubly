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

def edit
  @ordered_item = @order.ordered_items.find(params[:id])
end

def update
  @ordered_item = @order.ordered_items.find(params[:id])

  if @ordered_item.update(ordered_item_params)
    redirect_to restaurant_orders_path(@restaurant, @order)
  else
    render action: 'edit'
  end
end

def destroy
  @ordered_item = @order.ordered_items.find(params[:id])
  @ordered_item.destroy

  redirect_to restaurant_orders_path(@restaurant, @order)
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
