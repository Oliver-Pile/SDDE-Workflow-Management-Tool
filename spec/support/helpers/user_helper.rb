# frozen_string_literal: true

def login_user(user)
  # Before each test, create and login the user

  @request.env['devise.mapping'] = Devise.mappings[:user]
  # user.confirm! # Or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
  sign_in user
end
