class OrdersController < ApplicationController
  before_filter :load_restaurant
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  def index
    @orders = @restaurant.orders.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = @restaurant.orders.new
    @items = @restaurant.items
  end

  # GET /orders/1/edit
  def edit
    authorize @order
  end

  # POST /orders
  def create
    @order = @restaurant.orders.new(order_params)
    authorize @order

    if @order.save
      current_user.orders << @order
      redirect_to restaurant_orders_url, notice: 'Order was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /orders/1
  def update
    authorize @order

    if @order.update(order_params)
      redirect_to restaurant_orders_url, notice: 'Order was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /orders/1
  def destroy
    authorize @order
    @order.destroy
    redirect_to restaurant_orders_url, notice: 'Order was successfully destroyed.'
  end

  private

    def load_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = @restaurant.orders.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:item_id, :quantity, :note, :restaurant_id,
        :user_id, :user, :item_to_be_added, :finalize, :completed)
    end
end
