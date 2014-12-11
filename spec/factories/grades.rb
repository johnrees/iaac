# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :grade do
    association :grader, factory: :user
    association :student, factory: :user
    association :course
    value 6.55
    notes "some notes"
  end
end
