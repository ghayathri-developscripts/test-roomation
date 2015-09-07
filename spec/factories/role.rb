FactoryGirl.define do
  factory :role do
    name 'user'

    trait :user do end

    trait :admin do
      name 'admin'
    end

    trait :designer do
      name 'designer'
    end
  end
end
