FactoryGirl.define do
  sequence :email do |n|
    Faker::Internet.email + '.fake'
  end
  
  factory :photo_album do
    user
    name        { Faker::Name.name }
    description { Faker::Lorem.paragraph }
  end
  
  factory :photo do
    user
    association :album, :factory => :photo_album
    image       { File.new(Dir.glob("#{Rails.root}/app/assets/images/populate_images/#{rand(6)+1}.jpg").last) }
    description { Faker::Lorem.paragraph }
  end
end
