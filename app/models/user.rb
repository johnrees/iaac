class User < ActiveRecord::Base

  has_paper_trail
  rolify
  has_secure_password
  validates_uniqueness_of :public_email, :private_email

  validates :public_email, :first_name, :last_name, :country_code, presence: true

  has_many :grades, foreign_key: 'student_id'
  has_many :given_grades, class_name: 'Grade', foreign_key: 'grader_id'
  has_many :received_grades, class_name: 'Grade', foreign_key: 'student_id'

  def to_s
    "#{first_name} #{last_name}"
  end

  def courses
    if has_role? :admin
      Course.all
    else
      Course.with_role([:tutor,:student,:coordinator,:assistant], self)
    end
  end

  def country
    Country[country_code] if country_code.present?
  end

  # before_validation :default_email

  # def default_email
  #   self.private_email = "#{first_name.downcase}.#{last_name.downcase}@iaac.net"
  #   self.public_email = "#{first_name.downcase}.#{last_name.downcase}@gmail.com"
  #   self.password = 'password'
  #   self.password_confirmation = 'password'
  #   self.country_code = 'es'
  # end

end
