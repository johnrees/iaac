require 'rails_helper'

RSpec.describe Grade, :type => :model do

  it { should belong_to(:grader) }
  it { should belong_to(:student) }
  it { should belong_to(:course) }
  skip { should validate_presence_of(:grader) }
  skip { should validate_presence_of(:student) }
  skip { should validate_presence_of(:course) }
  skip { should validate_presence_of(:value) }

end
