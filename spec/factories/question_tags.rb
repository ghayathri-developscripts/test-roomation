# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question_tag, :class => 'QuestionTags' do
    question_id 1
    tag_id 1
  end
end
