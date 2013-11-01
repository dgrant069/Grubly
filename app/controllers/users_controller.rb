class UsersController < ApplicationController

  def index
    @users = User.all
    authorize @users
  end

  def show
    redirect_to users_path
  end

  def new
    redirect_to users_path
  end

  def create
    redirect_to users_path
  end

  def edit
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update(user_params)
      redirect_to users_path, notice: "User was successfully marked as owner"
    else
      redirect_to users_path, notice: "Action failed"
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
    params.require(:user).permit(:role)
  end
end
