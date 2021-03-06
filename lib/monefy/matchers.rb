class Monefy
  # Encapsulate all the logic to compare differente Monefy instances
  module Matchers

    # Check if two distinct Monefy instances are equal.
    #
    # @param monefy [Monefy] another Monefy instance.
    #
    # @return [Boolean] true if both instances are equal and false if they
    # are different.
    #
    # @example
    #   Monefy.new(50, 'EUR') == Monefy.new(40, 'EUR') # => false
    #   Monefy.new(50, 'EUR') == Monefy.new(55.5, 'USD') # => true
    def == monefy
      validate_monefy_instance(monefy)

      amount == converted_money_currency(monefy)
    end

    # Check if two distinct Monefy instances are different.
    #
    # @param monefy [Monefy] another Monefy instance.
    #
    # @return [Boolean] true if both instances are different and false if they
    # are equal.
    #
    # @example
    #   Monefy.new(50, 'EUR') != Monefy.new(40, 'EUR') # => true
    #   Monefy.new(50, 'EUR') != Monefy.new(55.5, 'USD') # => false
    def != monefy
      validate_monefy_instance(monefy)

      amount != converted_money_currency(monefy)
    end

    # Check if one Monefy instance is greater than another.
    #
    # @param monefy [Monefy] another Monefy instance.
    #
    # @return [Boolean] true if current instace is greater than another and
    # false if not.
    #
    # @example
    #   Monefy.new(50, 'EUR') > Monefy.new(40, 'EUR') # => true
    #   Monefy.new(50, 'EUR') > Monefy.new(200, 'USD') # => false
    def > monefy
      validate_monefy_instance(monefy)

      amount > converted_money_currency(monefy)
    end

    # Check if one Monefy instance is less than another.
    #
    # @param monefy [Monefy] another Monefy instance.
    #
    # @return [Boolean] true if current instace is less than another and
    # false if not.
    #
    # @example
    #   Monefy.new(50, 'EUR') < Monefy.new(40, 'EUR') # => false
    #   Monefy.new(50, 'EUR') < Monefy.new(200, 'USD') # => true
    def < monefy
      validate_monefy_instance(monefy)

      amount < converted_money_currency(monefy)
    end
  end
end
