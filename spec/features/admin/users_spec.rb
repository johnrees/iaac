require 'rails_helper'

RSpec.describe User, :type => :feature do

  it "lists users" do
    admin = FactoryGirl.create(:user)
    admin.add_role :admin

    FactoryGirl.create(:user, first_name: 'Steve', last_name: 'Irwin')
    login admin
    visit admin_users_path
    expect(page).to have_link('Irwin')
  end

  it "has user page" do
    admin = FactoryGirl.create(:user)
    admin.add_role :admin
    user = FactoryGirl.create(:user, first_name: 'Steve', last_name: 'Irwin')
    login admin
    visit admin_user_path(user)
    expect(page).to have_title('Steve Irwin')
  end

end