class CustomRegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(params)
    @user.password = 'password'

    if @user.save
      flash[:success] = 'User was successfully created'
      redirect_to manage_users_url()
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Other custom actions if needed
end