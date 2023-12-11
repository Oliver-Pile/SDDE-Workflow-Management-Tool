# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

@user1 = User.create!(email: "a@a.co", password: "password", username: "TheBestUser", role: "Admin")
@user2 = User.create(email: "b@b.co", password: "password", username: "AlsoPrettyGoodUser", role: "Operator")

@project_1 = Project.create(
  title: "The first project",
  description: "The is a project for testing",
  department: "Dev"
)

@project_2 = Project.create(
  title: "The completed project!",
  description: "Its finished!",
  department: "Ops"
)

Card.create(content: "My first card", status: "Backlog", project: @project_1)
Card.create(content: "My second card", status: "Ready", project: @project_1)
Card.create(content: "My third card", status: "In Progress", project: @project_1)
Card.create(content: "Another Card!", status: "Completed", project: @project_2)
