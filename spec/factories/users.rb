# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    public_email "MyString"
    private_email "MyString"
    password_digest "MyString"
  end
end
