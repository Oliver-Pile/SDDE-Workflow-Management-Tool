# frozen_string_literal: true

Given('There is a project') do
  @project = create(:project, title: "Dummy title", description: "I am a dummy description", department: "Testers")
end

Given('I visit the projects page') do
  visit projects_path
end

Given('I visit the project show page') do
  visit project_path(@project)
end

Given('I visit the project edit page') do
  visit edit_project_path(@project)
end

When('I modify the project title') do
  fill_in 'Title', with: 'An updated title'
end

When('I click update submit') do
  click_on 'Submit'
end

Then('I see the updated project title') do
  expect(page).to have_content 'An updated title'
end

Then('I see the project title') do
  expect(page).to have_content @project.title
end

Then('I see the project description') do
  expect(page).to have_content @project.description
end

Then('I see the project department') do
  expect(page).to have_content @project.department
end
