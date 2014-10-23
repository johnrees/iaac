class User < ActiveRecord::Base

  rolify
  has_secure_password
  validates_uniqueness_of :public_email
  validates :public_email, :first_name, :last_name, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end

  def c
    Course.with_role(:student, self).roots
  end

  def courses
    if has_role? :admin
      Course.all
    else
      Course.with_role([:tutor,:student,:coordinator,:assistant], self)
    end
  end

end
