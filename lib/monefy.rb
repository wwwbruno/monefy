require "monefy/converter"
require "monefy/version"

class Monefy
  include Monefy::Converter

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
