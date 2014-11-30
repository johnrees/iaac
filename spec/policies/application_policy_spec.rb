require 'rails_helper'

describe ApplicationPolicy do

  let(:grade) { build_stubbed(:grade) }
  subject(:policy) { ApplicationPolicy.new(user, grade) }

  context "for anyone" do
    let(:user) { create(:user) }

    it { is_expected.to_not allow(:index) }
    it { is_expected.to_not allow(:create) }
    it { is_expected.to_not allow(:update) }
    it { is_expected.to_not allow(:show) }
    it { is_expected.to_not allow(:new) }
    it { is_expected.to_not allow(:edit) }
    it { is_expected.to_not allow(:destroy) }
  end

end
