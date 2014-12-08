class GroupUser < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  validates_uniqueness_of :group, scope: [:user], on: :create
end
