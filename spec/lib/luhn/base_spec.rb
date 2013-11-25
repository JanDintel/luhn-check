require 'spec_helper'
require 'pry'

describe Base do
  let(:base)    { described_class.new(12345) }

  describe 'attributes' do
    it 'responds to attribute' do
      [:number_to_validate, :check_digit].each do |attr|
        expect(base).to respond_to attr
      end
    end
  end

  ## Class methods
  describe '.valid?' do
    context 'validate numbers' do
      # Different test creditcardnumbers from: Visa,
      # American Express, Diners Club and Mastercard
      let(:validate_numbers) { [4556974027974373, 4539085529167499, 5247381631434707, 4111111111111111,
                                5555555555554444, 5511828555531982, 371449635398431, 4716165622199,
                                869940826641794, 180002230256255, 3096704907107219, 214937935327366,
                                6011312159763625, 38442242218311] }

      it 'returns true' do
        validate_numbers.each do |number|
          expect(described_class.valid?(number)).to be_true
        end
      end
    end

    context 'invalid numbers' do
      let(:invalid_numbers) {  [3844224221831, 601111111111117, 1234123412341234, 1234567890123456, 111111,
                                22222222222000, 1111111111111111, 00010000, 23.67, 0000000000000000]}

      pending 'returns false' do
        invalid_numbers.each do |number|
          # binding.pry if described_class.valid?(number)
          # expect(described_class.valid?(number)).to be_false
        end
      end
    end
  end

  ## Instance methods
  describe '.validate' do
    describe 'validates the sum_of_all_numbers' do
      context 'modulo 10 is equal to 0' do
        before  { described_class.any_instance.
                    stub(:sum_of_all_numbers).
                    and_return(60) }

        it 'returns true' do
          expect(base.validate).to be_true
        end
      end

      context 'modulo 10 is NOT equal to 0' do
        before  { described_class.any_instance.
                    stub(:sum_of_all_numbers).
                    and_return(12) }

        it 'returns false' do
          expect(base.validate).to be_false
        end
      end
    end
  end

  describe '.sum_of_all_numbers' do
    before  { described_class.any_instance.
                stub(:double_odd_numbers).
                and_return [1,2,3,4,5] }

    it 'sums up the double_odd_numbers' do
      expect(base.sum_of_all_numbers).to eql 15
    end
  end

  # TODO: Make check for even
  describe '.double_odd_numbers' do
    subject { described_class.new(7992739871).double_odd_numbers }

    describe 'reverses the number set and on odd position of number' do
      it 'doubles and sums number' do
        expect(subject).to eql [1, 5, 8, 9, 3, 5, 2, 9, 9, 5]
      end

      context 'number ends with 0' do
        subject { described_class.new(8960).double_odd_numbers }

        it 'keeps the 0, doubles and sums number' do
          expect(subject).to eql [0,3,9,7]
        end
      end
    end
  end
end
