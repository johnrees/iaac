# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    name "Architecture Course"
    description "A description of the architecture course"
    published true
  end
end
