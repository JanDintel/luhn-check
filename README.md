# Luhn check

With the luhn-check you can check a number with the Luhn algorithm.

## Installation
### Version
`0.0.1`

Add this line to your application's Gemfile:

    gem 'luhn-check'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install luhn-check

## Usage

After the gem is installed. There are some helpers available.

To check if the number is valid with the Luhn algorithm:

  ```ruby
  Luhn.valid?(number)
  Luhn.calculate_check_digit(number)
  Luhn.double_digits(number) # Array with digits for checksum
  ```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
