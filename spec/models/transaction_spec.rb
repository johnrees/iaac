require 'rails_helper'

RSpec.describe Transaction, :type => :model do
  skip { should validate_presence_of(:amount_as_decimal)}
  it { should validate_presence_of(:description)}
  it { should belong_to(:user) }

  skip "has self.total"
  skip "has amount_as_decimal"

  skip "calls update_user after_save"

end
