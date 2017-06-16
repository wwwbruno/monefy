require "test_helper"

class MonefyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Monefy::VERSION
  end

  def test_instance_variable
    assert_equal 50, Monefy.new(50, 'EUR').amount
    assert_equal 'EUR', Monefy.new(50, 'EUR').currency
  end
end
