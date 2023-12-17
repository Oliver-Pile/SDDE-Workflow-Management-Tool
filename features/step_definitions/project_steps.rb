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

Given('I click the add project button') do
  click_on 'Add Project'
end

When('I modify the project title') do
  fill_in 'Title', with: 'An updated title'
end

When('I click submit') do
  click_on 'Submit'
end

When('I fill in the add project form') do
  fill_in 'Title', with: 'Foo'
  fill_in 'Description', with: 'Bar'
  fill_in 'Department', with: 'Baz'
end

When('I click archive') do
  click_on 'Archive this project'
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

Then('I see the new project') do
  expect(page).to have_content 'Foo'
  expect(page).to have_content 'Project was successfully created'
end

Then('I dont see the project') do
  expect(page).not_to have_content @project.title
end