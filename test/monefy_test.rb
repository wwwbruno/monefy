require "test_helper"

class MonefyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Monefy::VERSION
  end

  def test_instance_variable
    assert_equal 50, fifty_eur.amount
    assert_equal 'EUR', fifty_eur.currency
  end

  def test_inspect_method
    assert_equal "50.00 EUR", fifty_eur.inspect
  end

  def fifty_eur
    Monefy.new(50, 'EUR')
  end
end
