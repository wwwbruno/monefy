require "monefy/version"

class Monefy
  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency

    self
  end
end
