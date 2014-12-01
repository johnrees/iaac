require 'rails_helper'

describe GradePolicy do

  let(:grade) { build_stubbed(:grade) }
  subject(:policy) { GradePolicy.new(user, grade) }

  context "for a student" do
    let(:user) do
      user = create(:user)
      user.add_role :student
      return user
    end

    it { is_expected.to_not allow(:index) }
    it { is_expected.to_not allow(:create) }
    it { is_expected.to_not allow(:update) }
    it { is_expected.to_not allow(:show) }
    it { is_expected.to_not allow(:new) }
    it { is_expected.to_not allow(:edit) }
    it { is_expected.to_not allow(:destroy) }
  end

  context "for a tutor" do
    let(:user) do
      user = create(:user)
      user.add_role :tutor, grade.course
      return user
    end

    it { is_expected.to allow(:index) }
    it { is_expected.to allow(:create) }
    it { is_expected.to allow(:update) }
    it { is_expected.to_not allow(:show) }
    it { is_expected.to allow(:new) }
    it { is_expected.to allow(:edit) }
    it { is_expected.to_not allow(:destroy) }
  end

  context "for a tutor (of a different course)" do
    let(:user) do
      user = create(:user)
      user.add_role :tutor, build(:course)
      return user
    end

    it { is_expected.to allow(:index) }
    it { is_expected.to_not allow(:create) }
    it { is_expected.to_not allow(:update) }
    it { is_expected.to_not allow(:show) }
    it { is_expected.to_not allow(:new) }
    it { is_expected.to_not allow(:edit) }
    it { is_expected.to_not allow(:destroy) }
  end

end
