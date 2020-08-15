class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "You Create Success"
      redirect_to root_path
    else
      flash.now[:warning] = "You Created Failed"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :fullname, :email, :password, :password_confirmation
  end
end
