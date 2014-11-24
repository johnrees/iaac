class Charge < Transaction


  before_save :make_negative


private

  def make_negative
    self.amount = -(amount.abs)
  end

end