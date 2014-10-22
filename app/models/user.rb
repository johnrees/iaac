class User < ActiveRecord::Base

  rolify
  has_secure_password
  validates_uniqueness_of :public_email
  validates :public_email, :first_name, :last_name, presence: true

  # has_many :members
  # has_many :courses, through: :members

  def to_s
    "#{first_name} #{last_name}"
  end

  def c
    Course.with_role(:student, self).roots
  end

end
