class TutorMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  def role
    role_name.present? ? role_name : "Tutor"
  end
end
