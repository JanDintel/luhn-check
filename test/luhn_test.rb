require 'test_helper'

describe 'Luhn' do

  it 'returns hello' do
    Luhn.hello.must_equal('hello')
  end

  describe '.sum_of_all' do

    it 'computes the sum of all digits in number' do
      Luhn.sum_of_all(8).must_equal(8)
      Luhn.sum_of_all(8).must_equal(8)
      Luhn.sum_of_all(10).must_equal(1)
      Luhn.sum_of_all(12).must_equal(3)
      Luhn.sum_of_all(012).must_equal(3)
      Luhn.sum_of_all(88).must_equal(16)
      Luhn.sum_of_all(808).must_equal(16)
      Luhn.sum_of_all(000).must_equal(0)
    end
  end

  describe 'check_digit' do

    describe '.calculate_check_digit' do

      it 'computes the check digit of the .sum_of_all' do
        Luhn.check_digit(123).must_equal(0)
        Luhn.check_digit(492965255140195).must_equal(1)
        Luhn.check_digit(402400711116634).must_equal(3)
        Luhn.check_digit(199600).must_equal(8)
        Luhn.check_digit(700).must_equal(5)
      end
    end

    describe '.chomp_check_digit' do

      it 'chomps the last digit (check_digit) of the number' do
        Luhn.chomp_check_digit(1234).must_equal(4)
        Luhn.chomp_check_digit(4716410659076820).must_equal(0)
      end
    end
  end

  describe '.double_digits' do

    describe 'sum is greater than 9' do

      it 'computes the sum the digits of the sum' do
        Luhn.double_digits(5).must_equal([1])
        Luhn.double_digits(6).must_equal([3])
        Luhn.double_digits(9).must_equal([9])
        Luhn.double_digits(123).must_equal([6,2,2])
        Luhn.double_digits(4992739871).must_equal([2,7,16,9,6,7,4,9,18,4]) #goed?
        Luhn.double_digits(7992739871).must_equal([2,7,7,9,6,7,4,9,9,7])
      end
    end

    describe 'sum is less or equal than 9' do

      it 'computes the double of the digit' do
        Luhn.double_digits(1).must_equal([2])
        Luhn.double_digits(4).must_equal([8])
        Luhn.double_digits(5).wont_equal([10])
      end
    end
  end

  describe '.valid?' do
  end

end