module Luhn

  class << self

    def hello
      "hello"
    end

    def double_digits(number)
      doubles = []
      digits = all_digits(number).reverse
      digits.each_with_index do |d, i|
        sum = d + d if i.odd?
        if sum > 9
          doubles << sum.split(//).inject { |s| s + s }
        else
          doubles << sum
        end
      end
    end

    def sum_of_all(number)
      number.inject { |n| n + n }
    end

    protected

    def all_digits(number)
      number.to_s.split(//)
    end

  end
end
