class StudentMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :group
end
