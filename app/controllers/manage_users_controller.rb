class ManageUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_admin

  def index
    @users = User.all
    @user = User.new
  end

  private
  
  def check_user_admin
    if current_user.role != "Admin"
      flash[:danger] = "User is not authorised to access this page"
      redirect_to root_path
    end
  end
end
