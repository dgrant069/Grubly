class OrdersController < ApplicationController
  before_filter :load_parent, except: [:create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  def index
    @orders = @restaurant.orders.all
    #@orders_user = @user.orders.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @orders_restaurant = @restaurant.orders.new
    @orders_user = @user.orders.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = @restaurant.orders.new(order_params)

    if @order.save
      redirect_to restaurant_orders_url, notice: 'Order was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to orders_url, notice: 'Order was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to restaurant_orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    def load_parent
      @restaurant = Restaurant.find(request.path.split('/')[2].to_i)
      @user = current_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = @restaurant.orders.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:item_id, :quantity, :note, :restaurant_id,
        :user_id, :user, :item_to_be_added)
    end
end
