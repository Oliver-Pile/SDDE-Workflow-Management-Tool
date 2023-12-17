FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.unique.password }
    username { Faker::Internet.unique.username.gsub(/[_\W]+/, '') }
    role { "Dev" }
  end
end
