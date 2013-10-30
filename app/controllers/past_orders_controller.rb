class PastOrdersController < ApplicationController
  before_filter :load_user

  # GET /past_orders
  def index
    @past_orders = @user.orders.all
  end

  private

    def load_user
      @user = User.find(params[:user_id])
    end
end
