class OrderedItemsController < ApplicationController
  before_filter :load_order
  before_action :set_ordered_item, only: [:edit, :update, :destroy]

  def new
    @ordered_item = @order.ordered_items.new
    @items = @restaurant.items
  end

  def create
    @ordered_item = @order.ordered_items.new(ordered_item_params)
    authorize @order

    if @ordered_item.save
      redirect_to restaurant_order_path(@restaurant, @order), notice: 'Order item was successfully added.'
    else
      render action: 'new'
    end
  end

  def edit
    authorize @order
  end

  def update
    authorize @order

    if @ordered_item.update(ordered_item_params)
      redirect_to restaurant_order_path(@restaurant, @order), notice: 'Order was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    authorize @order
    @ordered_item.destroy
    redirect_to restaurant_order_path(@restaurant, @order), notice: 'Order item was successfully destroyed.'
  end

private

  def set_ordered_item
    @ordered_item = @order.ordered_items.find(params[:id])
  end

  def load_order
    @restaurant = Restaurant.find(params[:restaurant_id])
    @order = @restaurant.orders.find(params[:order_id])
  end

  def ordered_item_params
    params.require(:ordered_item).permit(:item_id, :quantity, :note, :restaurant_id,
        :user_id)
  end
end
