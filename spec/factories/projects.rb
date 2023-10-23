FactoryBot.define do
  factory :project do
    title { Faker::Name.unique.name }
    description { Faker::Movies::HarryPotter.quote }
    department { Faker::Company.industry }
  end
end
