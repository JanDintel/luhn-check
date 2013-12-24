require 'luhn/version'
require 'luhn/base'

module Luhn
  class LuhnError < StandardError; end
  class RequirementError < LuhnError; end

  def self.valid?(number)
    Luhn::Base.valid?(number)
  end
end
