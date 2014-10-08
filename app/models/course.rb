class Course < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :description

  def to_s
    name
  end

end
