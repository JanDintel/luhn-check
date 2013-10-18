require 'test_helper'

describe 'Luhn' do

  it 'returns pong' do
    Luhn.ping.must_equal('pong')
  end

  describe 'check_digit' do

    describe 'only for valid numbers' do

      describe '.calculate_check_digit' do

        it 'computes the check digit' do
          Luhn.calculate_check_digit(79927398713).must_equal(3)
          Luhn.calculate_check_digit(4539085529167499).must_equal(9)
          Luhn.calculate_check_digit(6011312159763625).must_equal(5)
          Luhn.calculate_check_digit(4111111111111111).must_equal(1)
          Luhn.calculate_check_digit(180002230256255).must_equal(5)
          Luhn.calculate_check_digit(6011312159763625).must_equal(5)
        end
      end
    end

    describe 'for all numbers' do

      describe '.get_check_digit' do

        it 'get last digit of number' do
          Luhn.get_check_digit(123).must_equal(3)
          Luhn.get_check_digit(7992739871).must_equal(1)
          Luhn.get_check_digit(492965255140195).must_equal(5)
          Luhn.get_check_digit(402400711116634).must_equal(4)
          Luhn.get_check_digit(199600).must_equal(0)
          Luhn.get_check_digit(4556974027974373).must_equal(3)
        end
      end
    end
  end

  describe '.double_digits' do

    describe 'sum is greater than 9' do

      it 'computes the sum the digits of the sum' do
        Luhn.double_digits(50).must_equal([0,1])
        Luhn.double_digits(60).must_equal([0,3])
        Luhn.double_digits(9).must_equal([9])
        Luhn.double_digits(90).must_equal([0,9])
        Luhn.double_digits(123).must_equal([3,4,1])
        Luhn.double_digits(4992739871).must_equal([1, 5, 8, 9, 3, 5, 2, 9, 9, 8])
        Luhn.double_digits(7992739871).must_equal([1, 5, 8, 9, 3, 5, 2, 9, 9, 5])
      end
    end

    describe 'sum is less or equal than 9' do

      it 'computes the double of the digit' do
        Luhn.double_digits(10).must_equal([0,2])
        Luhn.double_digits(40).must_equal([0,8])
        Luhn.double_digits(50531).must_equal([1,6,5,0,5])
      end
    end

  end

  describe 'all 0' do

    it 'rejects number with all 0' do
      Luhn.valid?(0000000000000000).must_equal(false)
    end
  end

  describe '.valid?' do

    describe 'valid number' do
      valid_numbers =  [4556974027974373, 4539085529167499, 5247381631434707, 4111111111111111, 5555555555554444,
                        5511828555531982, 371449635398431, 4716165622199, 869940826641794, 180002230256255,
                        3096704907107219, 214937935327366, 6011312159763625, 38442242218311]
      it 'is valid' do
        valid_numbers.each do |n|
          Luhnc.valid?(n).must_equal(true)
        end
      end

    end

    describe 'invalid number' do
      invalid_numbers =  [3844224221831, 601111111111117, 1234123412341234, 1234567890123456, 111111, 22222222222000,
                          1111111111111111, 00010000, 23.67, 0000000000000000]

      it 'is invalid' do
        invalid_numbers.each do |n|
          Luhn.valid?(n).must_equal(false)
        end
      end

    end
  end

end