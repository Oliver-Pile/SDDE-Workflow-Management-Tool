FactoryBot.define do
  factory :card do
    content { Faker::Movies::HarryPotter.quote  }
    status { "In Progress" }
  end
end
