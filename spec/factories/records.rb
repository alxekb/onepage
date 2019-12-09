FactoryBot.define do
  factory :record do
    user
    a { 10 }
    b { 20 }
    cmd { '+' }
    result { '30' }

    trait :sum do
      cmd { '+' }
      result { '30' }
    end

    trait :difference do
      cmd { '-' }
      result { '-10' }
    end

    trait :multiplication do
      cmd { '*' }
      result { '200' }
    end

    trait :division do
      cmd { '/' }
      result { '0.5' }
    end
  end
end