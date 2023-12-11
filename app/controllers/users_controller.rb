class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_admin

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

  def check_user_admin
    if current_user.role != "Admin"
      flash[:danger] = "User is not authorised to manipulate Users"
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :role)
  end
end