FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email      { Factory.next(:email) }
    phone      { Faker::PhoneNumber.phone_number }

    password "secret"
    password_confirmation {|m| m.password }

    roles { [ Role.user || Factory(:role, :user) ] }

    trait :admin do
      roles { [ Role.admin || Factory(:role, :admin) ] }
    end

    trait :designer do
      roles { [ Role.designer || Factory(:role, :designer) ] }
    end
  end
end
