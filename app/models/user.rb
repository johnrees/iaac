class User < ActiveRecord::Base

  has_paper_trail
  rolify
  has_secure_password
  validates_uniqueness_of :private_email, allow_nil: true, allow_blank: true
  validates_uniqueness_of :public_email

  validates :public_email, :first_name, :last_name, presence: true
  # :country_code,

  has_many :transactions
  has_many :payments
  has_many :charges

  has_many :grades, foreign_key: 'student_id'
  has_many :given_grades, class_name: 'Grade', foreign_key: 'grader_id'
  has_many :received_grades, class_name: 'Grade', foreign_key: 'student_id'

  # ransacker :student_users, :formatter => proc { |v|
  #   # [10,100]
  #   # User.with_role(:student,:any).map(&:id)
  #   # Course.find(v).students.map(&:id)
  #   # Role.joins(:users).where(:roles => { :name => :student, :resource_type => :student }, :users => {:id => v}).map(&:resource_id)
  #   # Role.joins(:users)
  #   # Course.find(v).students.map(&:id)
  #   [10,11]
  #   # User.with_role(:student,:any).map(&:id)
  # } do |parent|
  #   parent.table[:first_name]
  # end

  def third_person_singular
    if gender.present?
      if gender.upcase == "M"
        "himself"
      else
        "herself"
      end
    else
      "themself"
    end
    #{user.first_name} hasn't yet added any information about #{@user.third_person_singular}.
  end

  def to_s
    "#{first_name} #{last_name}"
  end

  def avatar
    photo.present? ? "#{photo}/convert?format=jpg&fit=crop&w=200&h=200" : "http://placehold.it/200x200"
  end

  def courses
    if has_role? :admin
      Course.select('courses.*,true as active')
    else
      c0 = Course.select('ancestry,id').with_role([:tutor,:student,:coordinator,:assistant], self).pluck('courses.ancestry,courses.id')
      c = c0.map{ |a| a.reject(&:blank?).first.to_s.split('/').first }.uniq
      likes = c.map{|val| "#{val}%" }
      Course.select("courses.*")
        .select("( (SELECT id = ANY ('{#{[c + c0.map(&:last)].flatten.join(',')}}'::int[]))  ) AS active")
        .where(
        "courses.id IN (?) OR courses.ancestry LIKE ANY (array[?]) OR courses.ancestry IN (?)",
        c,
        likes,
        c
      )

        # OR (SELECT ancestry LIKE ANY ('#{likes}') )
    end
  end

  def country
    Country[country_code] if country_code.present?
  end

  def self.fancy_amount num
    '%.2f' % (num||0)
  end

  def status
    User.fancy_amount financial_status
  end

  def enrolled_in? course
    # return true unless course.has_children?
    has_role?(:student, course) || has_role?(:tutor, course) || has_role?(:admin)
  end

  # before_validation :default_email

  # def default_email
  #   self.private_email = "#{first_name.downcase}.#{last_name.downcase}@iaac.net"
  #   self.public_email = "#{first_name.downcase}.#{last_name.downcase}@gmail.com"
  #   self.password = 'password'
  #   self.password_confirmation = 'password'
  #   self.country_code = 'es'
  # end

  # before_create { generate_token(:invitation_code) }

  # def send_password_reset
  #   generate_token(:password_reset_token)
  #   self.password_reset_sent_at = Time.zone.now
  #   save!
  #   UserMailer.password_reset(self).deliver
  # end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end


end
