class Group < ActiveRecord::Base

  validates :name, uniqueness: true, presence: true
  has_and_belongs_to_many :users

  def to_s
    name
  end

end
