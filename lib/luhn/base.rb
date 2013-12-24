module Luhn
  class Base
    attr_reader :number_to_validate

    def initialize(number_to_validate)
      @number_to_validate = number_to_validate
      number_meets_requirements?
    end

    def self.valid?(number)
      new(number).validate
    end

    def validate
      checksum % 10 == 0
    end

    def check_digit
      checksum.to_s[-1].to_i
    end

    def checksum
      @checksum ||= double_digit_on_even_position.inject(:+)
    end

    def double_digit_on_even_position
      total = []
      # Offset of 1, so you can call even? instead of odd? on a number_position
      digits_of_number_to_validate.to_enum.with_index(1).each do |digit, number_position|
        if number_position.even? && product_of_digit_exceeds_nine(digit)
          digits_of_product = split_to_number_array multiply(digit)
          total << digits_of_product.inject(:+)
        elsif number_position.even? && !product_of_digit_exceeds_nine(digit)
          total << multiply(digit)
        else
          total << digit
        end
      end
      total
    end

    private

    def number_meets_requirements?
      raise_fixnum_error    unless number_to_validate.class == Fixnum
      raise_zero_error      if number_to_validate.zero?
      raise_negative_error  if number_to_validate < 0
    end

    def digits_of_number_to_validate
      # Reverse number_to_validate to start
      # the itteration from right to left
      split_to_number_array(number_to_validate).reverse
    end

    def split_to_number_array(numbers)
      numbers.to_s.split(//).map(&:to_i)
    end

    def product_of_digit_exceeds_nine(digit)
      multiply(digit) > 9
    end

    def multiply(digit)
      digit * 2
    end

    def raise_fixnum_error
      raise(Luhn::RequirementError, 'Number must be of Fixnum')
    end

    def raise_zero_error
      raise(Luhn::RequirementError, 'Number is not allowed to be 0 (zero)')
    end

    def raise_negative_error
      raise(Luhn::RequirementError, 'Number is not allowed to be negative')
    end
  end
end
