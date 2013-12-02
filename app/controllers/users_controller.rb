class UsersController < ApplicationController

  def index
    @users = User.all
    authorize @users
  end

  def show
    @user = UserDecorator.find(params[:id])
    @orders = @user.orders.where(finalize: true)
    authorize @user
  end

  def new
    redirect_to users_path
  end

  def create
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User was successfully updated."
    else
      redirect_to user_path(@user), notice: "Action failed"
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy

    redirect_to users_path, notice: "User was successfully destroyed"
  end

private

  def user_params
    params.require(:user).permit(:role, :bio, :email)
  end
end
