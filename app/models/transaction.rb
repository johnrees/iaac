class Transaction < ActiveRecord::Base

  belongs_to :user
  after_save :update_user

  # before_validation :do_conversion
  attr_accessor :amount_as_decimal

  validates_presence_of :description
  # validates_presence_of :amount_as_decimal, :description

  default_scope{order('id desc')}

  def self.total
    self.pluck(:amount).inject(0, &:+)
  end

  def amount_as_decimal=(value)
    @amount_as_decimal = value
    self.amount = value.gsub(/[^0-9]/i, '')
  end

private

  # def do_conversion
  #   self.amount = amount_as_decimal * 100
  # end

  def update_user
    user.financial_status = user.transactions.pluck(:amount).inject(0, &:+)
    user.save
  end

end
