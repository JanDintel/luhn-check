require 'spec_helper'

describe Luhn do

  describe '.valid?' do
    it 'delegates the method to the Base class' do
      expect(Luhn::Base).to receive(:valid?).with(12345)
      described_class.valid?(12345)
    end
  end
end
