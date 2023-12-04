Given('There are many cards') do
  @card_a = create(:card, project: @project, users: [@primary_user])
  @card_b = create(:card, project: @project)
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