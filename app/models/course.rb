class Course < ActiveRecord::Base
  resourcify
  acts_as_tree order: 'sort_order'

  validates_presence_of :name
  validates_presence_of :description

  def to_s
    name
  end

  def tutors
    User.with_role(:tutor, self)
  end

  def students
    User.with_role(:student, self)
  end

end
