# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :grade do
    grader nil
    student nil
    course nil
    value 1
    notes "MyText"
  end
end
