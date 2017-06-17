require "test_helper"

describe Monefy do
  before { Monefy.class_variable_set :@@currencies_rates, nil }

  describe "when not set conversion_rates" do
    it "raises an error" do
      assert_raises StandardError do
        Monefy.new(50, 'EUR')
      end
    end
  end

  describe "when set conversion_rates" do
    before do
      Monefy.conversion_rates('EUR', {
        'USD'     => 1.11,
        'Bitcoin' => 0.0047
      })

      @fifty_eur = Monefy.new(50, 'EUR')
    end

    it "access a Monefy instance variables" do
      assert_equal 50, @fifty_eur.amount
      assert_equal 'EUR', @fifty_eur.currency
    end

    it "converts to string" do
      assert_equal "50.00 EUR", "#{@fifty_eur}"
    end
  end
end
