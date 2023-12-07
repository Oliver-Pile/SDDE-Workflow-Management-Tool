class UsersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.new(user_params)
    @user.password = 'password'

    if @user.save
      flash[:success] = 'User was successfully created'
      redirect_to manage_users_url()
    else
      flash[:danger] = 'User was not created. Please try again'
      redirect_to manage_users_url()
    end
  end

  private


  def user_params
    params.require(:user).permit(:username, :email)
  end
end