require "test_helper"

describe Monefy::Operators do
  describe "when set conversion_rates" do
    before do
      Monefy.class_variable_set :@@currencies_rates, nil
      Monefy.conversion_rates('EUR', {
        'USD'     => 1.11,
        'Bitcoin' => 0.0047
      })

      @fifty_eur = Monefy.new(50, 'EUR')
      @twenty_dollars = Monefy.new(20, 'USD')
    end

    it "returns 68.02 EUR instance when adding 20 USD to 50 EUR" do
      assert_equal Monefy.new(68.02, 'EUR'), @fifty_eur + @twenty_dollars
    end

    it "returns 31.98 EUR instance when subtracting 20 USD to 50 EUR" do
      assert_equal Monefy.new(31.98, 'EUR'), @fifty_eur - @twenty_dollars
    end

    it "returns 25 EUR instance when splitting 50 EUR by 2" do
      assert_equal Monefy.new(25, 'EUR'), @fifty_eur / 2
    end

    it "returns 60 USD instance when splitting 50 EUR by 2" do
      assert_equal Monefy.new(60, 'USD'), @twenty_dollars * 3
    end
  end
end
