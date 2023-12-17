Given('I am a user') do
  @primary_user = create(:user)
  @secondary_user = create(:user)
end

Given('I am not logged in') do
  visit user_session_path
end

Given('I press logout') do
  click_on "Log out"
end

Given('I visit the manage user page') do
  click_on "Manage Users"
end

Given("I click add user") do
  click_on "Add user"
end

Given("I select edit user") do
  click_on "Edit" #Within?
end

When('I login') do
  visit user_session_path
  fill_in :user_email, with: @primary_user.email
  fill_in :user_password, with: @primary_user.password
  find('#loginBtn').click
end

When("I fill in the add user form") do
  fill_in 'Email', with: 'foo@example.com'
  fill_in 'Username', with: 'fooUsername'
  select 'Admin', from: 'Role' 
end

When("I click add") do
  click_on 'Add'
end

When("I fill in the edit users form") do
  fill_in 'Email', with: 'updated@example.com'
end

When("I select delete user") do
  click_on 'Delete' #Within?
end

Then('I see the login page') do
  expect(page).to have_content "Log in"
end

Then('I see the project index page') do
  expect(page).to have_content "Projects"
end

Then('I see a success message') do
  expect(page).to have_content "Signed in successfully"
end

Then('I see the new user') do
  expect(page).to have_content "foo@example.com"
  expect(page).to have_content "fooUsername"
end

Then('I see a list of users') do
  expect(page).to have_content @primary_user.email
  expect(page).to have_content @secondary_user.email
end

Then("I see the updated user") do
  expect(page).to have_content "updated@example.com"
end

Then("I cant see the deleted user") do
  expect(page).not_to have_content @primary_user.email
end