When("I click view report") do
  click_on "View Report"
end

Then("I see a report for the project") do
  expect(page).to have_content "Total Cards: #{@project.cards.count}"
  expect(page).to have_content "Completed Cards: #{@project.cards.completed.count}/#{@project.cards.count}"
end