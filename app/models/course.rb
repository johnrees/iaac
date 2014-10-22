class Course < ActiveRecord::Base
  resourcify
  acts_as_tree order: 'sort_order'

  validates_presence_of :name
  validates_presence_of :description

  # has_many :members
  # has_many :students, -> { where(members: { type: 'Student'}) }, through: :members, source: :user
  # has_many :tutors, -> { where(members: { type: 'Tutor'}) }, through: :members, source: :user
  # %w(student coordinator assistant tutor).each do |person|
  #   has_many person.pluralize.to_sym, through: :members, source: person.to_sym
  # end

  def to_s
    name
  end

end
