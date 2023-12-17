Given('There are many cards') do
  @card_a = create(:card, project: @project, users: [@primary_user])
  @card_b = create(:card, project: @project)
end

Given('I click add card') do
  click_on 'Add Card'
end

Given('I click on a card') do
  click_on @card_b.content
end

Given('I click on a card with an assigned user') do
  click_on @card_a.content
end

When('I fill in the add card form') do
  fill_in "Content",	with: "foo_content"
  select "Ready", from: 'Status' 
end

When('I fill in the update card form') do
  fill_in "Content",	with: "updated_content"
end

When('I update the assigned user') do
  select @secondary_user.username, from: 'Users' 
end

When('I remove the assigned user') do
  select = page.find('select#card_user_ids')
  select.unselect @primary_user.username
end

When('I click the only mine toggle') do
  click_on "Show my cards only"
end

Then('I see the cards content') do
  expect(page).to have_content @card_a.content
end

Then('I see the cards status') do
  expect(page).to have_content @card_a.status
end

Then('I see the cards assignees') do
  expect(page).to have_content @card_a.users.first.username
end

Then('I see the new card') do
  expect(page).to have_content "foo_content"
end

Then('I see the updated card') do
  expect(page).to have_content "updated_content"
end

Then('I see the card with the updated user') do
  expect(page).to have_content @secondary_user.username
end

Then('I see the card with no users') do
  expect(page).not_to have_content @primary_user.username
end

Then('I can see my cards') do
  expect(page).to have_content @card_a.content
end

Then('I cant see any other cards') do
  expect(page).not_to have_content @card_b.content
end
