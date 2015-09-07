# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :discount do
    name "MyString"
    amount 1
    type 1
    expiration_date "2012-11-19 11:45:14"
    code "MyString"
    package_id 1
  end
end
