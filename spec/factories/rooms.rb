# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    project_id 1
    room_size "W:5 H:3 D:5"
    windows "MyText"
    title "MyString"
  end
end
