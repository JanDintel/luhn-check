require 'pry'

module Luhn

  class << self

    def ping
      'pong'
    end

    def valid?(number)
      checksum(number)
    end

    def calculate_check_digit(number)
      number_without_check_digit = number.to_s[0...-1] + '0'
      doubles = double_digits(number_without_check_digit.to_i)
      sum = sum_of_all(doubles) unless null?(doubles)
      product = sum * 9
      get_check_digit(product)
    end

    def get_check_digit(number)
      number.to_s[-1].to_i
    end

    def double_digits(number)
      doubles = []
      digits = all_digits(number).reverse
      digits.each_with_index do |d, i|
        if i.odd?
          sum = d * 2
          if sum && sum > 9
            split_sum   = sum.to_s.split(//).map(&:to_i)
            make_sum    = split_sum.inject { |sum, n| sum + n }
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

    def checksum(number)
      if null?(number)
        return false
      else
        doubles = double_digits(number)
        sum = sum_of_all(doubles)
        sum % 10 == 0 ? true : false
      end
    end

    def sum_of_all(doubles)
      doubles.inject { |sum, n| sum + n }
    end

    def all_digits(number)
      number.to_s.split(//).map(&:to_i)
    end

    def null?(number)
      checked_number = all_digits(number).reject! { |d| d.eql?(0) }
      if checked_number.nil?
        return false
      else
        checked_number.empty? ? true : false
      end
    end

  end
end
