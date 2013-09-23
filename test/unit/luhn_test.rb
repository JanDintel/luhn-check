require 'minitest/autorun'

describe Luhn do

  describe '.sum_of_all' do

    it 'computes the sum of all digits in number' do
      Luhn::Check.sum_of_all(8).assert_equal(8)
      Luhn::Check.sum_of_all(10).assert_equal(1)
      Luhn::Check.sum_of_all(12).assert_equal(3)
      Luhn::Check.sum_of_all(012).assert_equal(3)
      Luhn::Check.sum_of_all(88).assert_equal(16)
      Luhn::Check.sum_of_all(808).assert_equal(16)
      Luhn::Check.sum_of_all(000).assert_equal(0)
    end
  end

  describe 'check_digit' do

    describe '.calculate_check_digit' do

      it 'computes the check digit of the .sum_of_all' do
        Luhn::Check.check_digit(123).assert_equal(0)
        Luhn::Check.check_digit(492965255140195).assert_equal(1)
        Luhn::Check.check_digit(402400711116634).assert_equal(3)
        Luhn::Check.check_digit(199600).assert_equal(8)
        Luhn::Check.check_digit(700).assert_equal(5)
      end
    end

    describe '.chomp_check_digit' do

      it 'chomps the last digit (check_digit) of the number' do
        Luhn::Check.chomp_check_digit(1234).assert_equal(4)
        Luhn::Check.chomp_check_digit(4716410659076820).assert_equal(0)
      end
    end
  end

  describe '.double_digits' do

    describe 'product is greater than 9' do

      it 'computes the sum the digits of the product' do
        Luhn::Check.double_digits(5).assert_equal([1])
        Luhn::Check.double_digits(6).assert_equal([3])
        Luhn::Check.double_digits(9).assert_equal([9])
        Luhn::Check.double_digits(123).assert_equal([6,2,2])
        Luhn::Check.double_digits(4992739871).assert_equal([2,7,16,9,6,7,4,9,18,4]) #goed?
        Luhn::Check.double_digits(7992739871).assert_equal([2,7,7,9,6,7,4,9,9,7])
      end
    end

    describe 'product is less or equal than 9' do

      it 'computes the double of the digit' do
        Luhn::Check.double_digits(1).assert_equal([2])
        Luhn::Check.double_digits(4).assert_equal([8])
        Luhn::Check.double_digits(5).assert_not_equal([10])
      end
    end
  end

  describe '.valid?' do
  end

end