class Course < ActiveRecord::Base
  has_paper_trail
  resourcify
  acts_as_tree order: 'sort_order'

  has_many :grades

  validates_presence_of :name
  validates_presence_of :description

  attr_accessor :student_ids, :tutor_ids

  before_update :add_people

  def to_param
    "#{id}-#{name.gsub('.','').parameterize}-#{created_at.year}"
  end

  def to_s
    name
  end

  # def tutors
  #   User.with_role(:tutor, self)
  # end

  def tutors
    self_and_descendants.map{ |d| [User.with_role(:tutor, d)] }.flatten.uniq.sort! { |a,b| a.last_name <=> b.last_name }
  end

  def students
    self_and_descendants.map{ |d| [User.with_role(:student, d)] }.flatten.uniq.sort! { |a,b| a.last_name <=> b.last_name }
  end

  def full_name
    [name,subtitle].reject(&:blank?).join(' / ')
  end

  def highlight? course_id
    self_and_ancestors_ids.include? course_id
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
