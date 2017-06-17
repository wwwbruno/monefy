class Monefy
  # Encapsulate all the logic to handle basics arithmetic between two instances.
  module Arithmetic

    # Sum two Monefy instances
    #
    # @param monefy [Monefy] another Monefy instance.
    #
    # @return [Monefy] new Monefy instance with added amount.
    #
    # @example
    #   Monefy.new(50, 'EUR') + Monefy.new(20, 'USD')
    #   => #<Monefy:0x... @amount=68.02, @currency="EUR">
    def + monefy
      validate_monefy_instance(monefy)

      new_amount = amount + converted_money_currency(monefy)

      create_new_instace(new_amount, currency)
    end

    # Subtract two Monefy instances
    #
    # @param monefy [Monefy] another Monefy instance.
    #
    # @return [Monefy] new Monefy instance with subtracted amount.
    #
    # @example
    #   Monefy.new(50, 'EUR') - Monefy.new(20, 'USD')
    #   => #<Monefy:0x... @amount=31.98, @currency="EUR">
    def - monefy
      validate_monefy_instance(monefy)

      new_amount = amount - converted_money_currency(monefy)

      create_new_instace(new_amount, currency)
    end

    # Split a Monefy instances amount
    #
    # @param value [Integer, Float] value to split the Monefy instance amount.
    #
    # @return [Monefy] new Monefy instance with splited amount.
    #
    # @example
    #   Monefy.new(50, 'EUR') / 2
    #   => #<Monefy:0x... @amount=25, @currency="EUR">
    def / value
      validate_arithmetic_value(value)

      new_amount = (amount.to_f / value.to_f)

      create_new_instace(new_amount, currency)
    end

    # Multiply a Monefy instances amount
    #
    # @param value [Integer, Float] value to multiply the Monefy instance
    # amount.
    #
    # @return [Monefy] new Monefy instance with multiplied amount.
    #
    # @example
    #   Monefy.new(50, 'EUR') * 3
    #   => #<Monefy:0x... @amount=150, @currency="EUR">
    def * value
      new_amount = (amount.to_f * value.to_f)

      create_new_instace(new_amount, currency)
    end

    private

    def validate_monefy_instance(monefy)
      return if monefy.instance_of? Monefy

      raise StandardError, "Not a Monefy instance parameter"
    end

    def validate_arithmetic_value(value)
      return if value.is_a? Numeric

      raise StandardError, "Not an numeric parameter"
    end
  end
end
