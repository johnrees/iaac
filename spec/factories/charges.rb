FactoryGirl.define do

  factory :charge do
    association :user
    amount -50
    description "a charge"
    occurred_at "2014-11-19 11:45:46"
  end

end
