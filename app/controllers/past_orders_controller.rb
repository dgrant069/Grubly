class PastOrdersController < ApplicationController
  before_filter :load_user

  # GET /past_orders
  def index
    @past_orders = @user.orders.all
  end

  # GET /past_orders/1
  def show
  end

  # GET /past_orders/new
  def new
    @past_order = PastOrder.new
  end

  # GET /past_orders/1/edit
  def edit
  end

  # POST /past_orders
  def create
    @past_order = PastOrder.new(past_order_params)

    if @past_order.save
      redirect_to @past_order, notice: 'Past order was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /past_orders/1
  def update
    if @past_order.update(past_order_params)
      redirect_to @past_order, notice: 'Past order was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /past_orders/1
  def destroy
    @past_order.destroy
    redirect_to past_orders_url, notice: 'Past order was successfully destroyed.'
  end

  private
    def load_user
      @user = User.find(params[:user_id])
    end

    # Use callbacks to share common setup or constraints between actions.
#    def set_past_order
 #     @past_order = PastOrder.find(params[:id])
  #  end

    # Only allow a trusted parameter "white list" through.
    def past_order_params
      params[:past_order].permit(:item_id, :quantity, :note, :restaurant_id, :user_id, :user)
    end
end
