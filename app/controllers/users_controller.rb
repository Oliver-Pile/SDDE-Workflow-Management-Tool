class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.password = 'password'

    if @user.save
      flash[:success] = 'User was successfully created'
      redirect_to manage_users_url()
    else
      render :new, status: :unprocessable_entity
    end
  end

  private


  def user_params
    params.require(:user).permit(:username, :email)
  end
end