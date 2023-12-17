FactoryBot.define do
  sequence :content do |n|
    "#{Faker::Movies::HarryPotter.quote}#{n}"
  end
  factory :card do
    content { generate(:content) }
    status { "In Progress" }
  end
end
