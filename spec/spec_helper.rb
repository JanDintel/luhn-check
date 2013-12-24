require 'coveralls'
Coveralls.wear!

require 'luhn'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = 'random'
end
