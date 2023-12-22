class ManageUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_role

  def index
    @users = User.all
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      flash[:danger] = 'Warning: Cant delete current user'
      redirect_to manage_users_url
    else
      @user.destroy
      flash[:danger] = 'User was successfully deleted'
      redirect_to manage_users_url
    end
  end
  private
  
  def check_user_role
    if !current_user.role.in?(["Dev", "Admin", "Observer"])
      flash[:danger] = "User is not authorised to access this page"
      redirect_to root_path
    end
  end
end
