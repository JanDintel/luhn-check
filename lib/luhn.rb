require 'luhn/version'
require 'luhn/base'

module Luhn

  def self.valid?(number)
    Luhn::Base.valid?(number)
  end
end
