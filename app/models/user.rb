class User < ActiveRecord::Base
  has_paper_trail
  rolify
  has_secure_password
  validates_uniqueness_of :public_email

  validates :public_email, :first_name, :last_name, :country_code, presence: true

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

end
