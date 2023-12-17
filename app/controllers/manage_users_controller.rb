class ManageUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_role

  def index
    @users = User.all
    @user = User.new
  end

  private
  
  def check_user_role
    if !current_user.role.in?(["Dev", "Admin", "Observer"])
      flash[:danger] = "User is not authorised to access this page"
      redirect_to root_path
    end
  end
end
