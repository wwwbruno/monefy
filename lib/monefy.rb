require "monefy/version"

class Monefy
  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency

    self
  end

  def inspect
    "#{'%.02f' % amount} #{currency}"
  end
end
