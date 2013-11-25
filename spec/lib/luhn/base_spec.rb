require 'spec_helper'

describe Base do

  describe 'attributes' do
    subject { described_class.new(123) }

    it 'responds to attribute' do
      [:number, :check_digit].each do |attr|
        expect(subject).to respond_to attr
      end
    end
  end

  ## Class methods
  describe '.valid?' do
    subject { described_class.valid?(4556974027974373) }

    it 'returns true' do
      expect(subject).to be_true
    end
  end

  ## Instance methods
  describe '.validate' do
    subject { described_class.new(12345).validate }

    describe 'validates the sum_of_all_numbers' do
      context 'modulo 10 is equal to 0' do
        before  { described_class.any_instance.
                    stub(:sum_of_all_numbers).
                    and_return(60) }

        it 'returns true' do
          expect(subject).to be_true
        end
      end

      context 'modulo 10 is NOT equal to 0' do
        before  { described_class.any_instance.
                    stub(:sum_of_all_numbers).
                    and_return(12) }

        it 'returns false' do
          expect(subject).to be_false
        end
      end
    end
  end

  describe '.sum_of_all_numbers' do
    before  { described_class.any_instance.
                stub(:double_odd_numbers).
                and_return [1,2,3,4,5] }

    subject { described_class.new(12345).sum_of_all_numbers }

    it 'sums up the double_odd_numbers' do
      expect(subject).to eql 15
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
