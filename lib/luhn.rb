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
      doubles = double_digits(number)
      sum_of_all(doubles) unless null?(doubles)
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

    def checksum(number)
      check_digit = calculate_check_digit(number)
      unless check_digit.nil?
        check_digit % 10 == 0 ? true : false
      else
        return false
      end
    end

    def sum_of_all(doubles)
      doubles.inject { |sum, n| sum + n }
    end

    def all_digits(number)
      ary = number.to_s.split(//)
      return ary.map { |string| string.to_i }
    end

    def null?(doubles)
      checked_doubles = doubles.reject { |d| d.eql?(0) }
      return true if checked_doubles.empty?
    end

  end
end
