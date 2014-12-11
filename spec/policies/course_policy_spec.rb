require 'rails_helper'

describe CoursePolicy do

  let(:course) { create(:course) }
  subject(:policy) { CoursePolicy.new(user, course) }

  context "for a student" do
    let(:user) do
      user = create(:user)
      course.students << user
      return user
    end

    it { is_expected.to allow(:show) }
    it { is_expected.to allow(:index) }
    it { is_expected.to_not allow(:create) }
    it { is_expected.to_not allow(:new) }
    it { is_expected.to_not allow(:update) }
    it { is_expected.to_not allow(:edit) }
    it { is_expected.to_not allow(:destroy) }
  end

end
