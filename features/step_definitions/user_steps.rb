Given('I am a user') do
  @primary_user = create(:user)
end

When('I login') do
  visit user_session_path
  fill_in :user_email, with: @primary_user.email
  fill_in :user_password, with: @primary_user.password
  find('#loginBtn').click
end