class Base
  attr_reader :number, :check_digit

  def initialize(number)
    @number = number
    # @check_digit = calculate_check_digit
  end

  def self.valid?(number)
    new(number).validate
  end

  def validate
    sum_of_all_numbers % 10 == 0
  end

  def sum_of_all_numbers
    double_odd_numbers.inject { |sum, n| sum + n }
  end

  def double_odd_numbers
    # Reverse number to start the itteration from right
    digits_of_number = split_to_numbers(number).reverse
    total = []
    digits_of_number.each_with_index do |digit, i|
      if i.odd? && product_exceeds_nine(digit)
        split_product = split_to_numbers(product(digit))
        total << split_product.inject { |sum, n| sum + n }
      elsif i.odd? && !product_exceeds_nine(digit)
        total << product(digit)
      else
        total << digit
      end
    end
    total
  end

  private

  def split_to_numbers(numbers)
    numbers.to_s.split(//).map(&:to_i)
  end

  def product_exceeds_nine(digit)
    product(digit) > 9
  end

  def product(digit)
    digit * 2
  end
end
