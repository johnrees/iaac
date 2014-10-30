class Course < ActiveRecord::Base
  has_paper_trail
  resourcify
  acts_as_tree order: 'sort_order'

  validates_presence_of :name
  validates_presence_of :description

  attr_accessor :student_ids, :tutor_ids

  before_update :add_people

  def to_s
    name
  end

  def tutors
    User.with_role(:tutor, self)
  end

  def students
    User.with_role(:student, self)
  end

private

  def add_people

    if student_ids.present?
      # add students
      User.find(student_ids.reject(&:blank?)).each do |user|
        user.add_role :student, self
      end
    end

    if tutor_ids.present?
      # add tutors
      User.find(tutor_ids.reject(&:blank?)).each do |user|
        user.add_role :tutor, self
      end
    end

  end

end
