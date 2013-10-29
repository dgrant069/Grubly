class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :load_restaurant

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
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = @restaurant.orders.new(order_params)

    if @order.save
      redirect_to @restaurant, notice: 'Order was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    def load_restaurant
      @resource, id = request.path.split('/')[1,2]
      @restaurant = @resource.singularize.classify.constantize.find(id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = @restaurant.orders.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:item_id, :quantity, :note, :restaurant_id, :user_id)
    end
end
