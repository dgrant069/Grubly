class ItemsController < ApplicationController
  before_filter :load_restaurant
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    @items = @restaurant.items.all
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    @item = @restaurant.items.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = @restaurant.items.new(item_params)
    @item.restaurant_id = @restaurant.id

    if @item.save
      redirect_to @restaurant, notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @restaurant, notice: 'Item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to restaurant_items_url, notice: 'Item was successfully destroyed.'
  end

  private
    def load_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = @restaurant.items.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:item_id, :dish_name, :dollars, :cents, :description, :subcategory,
        :inventory, :restaurant_id)
    end
end
