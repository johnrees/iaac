require 'rails_helper'

RSpec.describe Grade, :type => :model do

  it { should belong_to(:grader) }
  it { should belong_to(:student) }
  it { should belong_to(:course) }
  it { should validate_presence_of(:grader) }
  it { should validate_presence_of(:student) }
  it { should validate_presence_of(:course) }
  it { should validate_presence_of(:value) }

end
