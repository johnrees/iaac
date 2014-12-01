# 0-3   FAIL (this means that the student is not going to get his Master Degree, so this grade has to be justified and well explained)
# 4     INCOMPLETE (this means that the tutor has to offer another deadline in order to receive a second submission that he will grade again)
# 5-6   LOW PASS
# 7-8   PASS
# 9-10  HIGH PASS

# The grading of the class will be based on :

# I.  Attendance
# II. Effort/Commitment
# III. Discussion/Participation
# IV. Final Outcome/achievement (depending on seminar’s requirements)
# V.  Blog Posts (depending on seminar’s requirements)
# VI. Public Presentation


class Grade < ActiveRecord::Base
  belongs_to :grader, class_name: 'User'
  belongs_to :student, class_name: 'User'
  belongs_to :course
  # validates :grader, :student, :course, :value, presence: true

  def value_as_decimal
    @value_as_decimal ||= sprintf "%.2f", (value ? value/100.0 : 0)
  end

  def value_as_decimal=(v)
    @value_as_decimal = v
    self.value = v.gsub(/[^0-9]/i, '')
  end

  GRADES = %w(fail fail fail incomplete low_pass low_pass pass pass high_pass high_pass).map(&:humanize)

  def self.for student, course
    find_or_initialize_by({student: student, course: course})
  end

  def to_s
    [value, course].join(' - ')
  end

end
