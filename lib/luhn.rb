require 'pry'

module Luhn

  class << self

    def hello
      "hello"
    end

    def calculate_check_digit(number)
      doubles = double_digits(number)
      sum_of_all(doubles)
    end

    def double_digits(number)
      doubles = []
      digits = all_digits(number).reverse
      digits.each_with_index do |d, i|
        if i.odd? == true
          sum = d * 2
          if sum > 9 || !sum.nil?
            split_sum   = sum.to_s.split(//)
            to_int      = split_sum.map { |m| m.to_i }
            make_sum    = to_int.inject { |sum, n| sum + n }
            doubles     << make_sum
          else
            doubles << sum
          end
        else
          doubles << d
        end
      end
      return doubles
    end

    protected

    def sum_of_all(doubles)
      doubles.inject { |sum, n| sum + n }
    end

    def all_digits(number)
      ary = number.to_s.split(//)
      return ary.map { |string| string.to_i }
    end

  end
end
