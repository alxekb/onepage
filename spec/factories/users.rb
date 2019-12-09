FactoryBot.define  do
  factory :user do
    sequence(:username) { |n| [Faker::Name.first_name, n].join }
  end
end