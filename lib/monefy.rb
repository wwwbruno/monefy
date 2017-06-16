require "monefy/converter"
require "monefy/operators"
require "monefy/version"

class Monefy
  include Monefy::Converter
  include Monefy::Operators

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
