class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :public_email
  validates :public_email, :first_name, :last_name, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end

end
