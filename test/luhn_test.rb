require 'test_helper'

describe 'Luhn' do

  it 'returns hello' do
    Luhn.hello.must_equal('hello')
  end

  describe 'check_digit' do

    describe '.calculate_check_digit' do

      it 'computes the check digit of the .sum_of_all' do
        Luhn.calculate_check_digit(123).must_equal(8)
        Luhn.calculate_check_digit(492965255140195).must_equal(60)
        Luhn.calculate_check_digit(402400711116634).must_equal(46)
        Luhn.calculate_check_digit(199600).must_equal(26)
        Luhn.calculate_check_digit(700).must_equal(7)
      end
    end
  end

  describe '.double_digits' do

    describe 'sum is greater than 9' do

      it 'computes the sum the digits of the sum' do
        Luhn.double_digits(50).must_equal([0,1])
        Luhn.double_digits(60).must_equal([0,3])
        Luhn.double_digits(90).must_equal([0,9])
        Luhn.double_digits(123).must_equal([3,4,1])
        Luhn.double_digits(4992739871).must_equal([1,5,8,9,3,5,2,9,9,8])
        Luhn.double_digits(7992739871).must_equal([1,5,8,9,3,5,2,9,9,5])
      end
    end

    describe 'sum is less or equal than 9' do

      it 'computes the double of the digit' do
        Luhn.double_digits(10).must_equal([0,2])
        Luhn.double_digits(40).must_equal([0,8])
        Luhn.double_digits(50).wont_equal([10])
      end
    end
  end

  describe '.valid?' do
  end

end