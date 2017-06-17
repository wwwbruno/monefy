require "test_helper"

describe Monefy::Operators do
  def test_plus
    fifty_eur = Monefy.new(50, 'EUR')
    twenty_dollars = Monefy.new(20, 'USD')

    assert_equal Monefy.new(68.02, 'EUR'), (fifty_eur + twenty_dollars)
  end

  def test_minus
    fifty_eur = Monefy.new(50, 'EUR')
    twenty_dollars = Monefy.new(20, 'USD')

    assert_equal Monefy.new(31.98, 'EUR'), (fifty_eur - twenty_dollars)
  end

  def test_splitter
    fifty_eur = Monefy.new(50, 'EUR')

    assert_equal Monefy.new(25, 'EUR'), (fifty_eur / 2)
  end

  def test_multiplier
    twenty_dollars = Monefy.new(20, 'USD')

    assert_equal Monefy.new(60, 'USD'), (twenty_dollars * 3)
  end
end
