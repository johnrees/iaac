# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Rees"
    public_email "john@iaac.net"
    private_email "john@bitsushi.com"
    country_code "GB"
    password "password1234"
    password_confirmation "password1234"
  end
end
