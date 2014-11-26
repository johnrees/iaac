FactoryGirl.define do
  factory :transaction do
    association :user
    amount 100
    description "MyText"
    occurred_at "2014-11-19 11:45:46"
  end

end
