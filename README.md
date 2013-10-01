# Luhn check

With the luhn-check you can check a number with the Luhn algorithm.

## Installation
### Version
`0.0.2`

###Gemfile

Since that the namespace in the `lib` directory is different than the name of the gem. You need to require the namespace of the class defined in the `lib` directory. 

Add this line to your application's Gemfile:

    gem 'luhn-check', '~> 0.0.2', require: 'luhn'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install luhn-check

## Usage

After the gem is installed. There are some helpers available.

To check if the number is valid with the Luhn algorithm:

  ```ruby
  # Check if the number is valid with the Luhn algorithm
  Luhn.valid?(number)

  # Calculate the check digit based on the number
  Luhn.calculate_check_digit(number)

  # Retrieve the check digit of the number (last digit)
  Luhn.get_check_digit(number)

  # Calculate the sum of the digits after the double action
  Luhn.double_digits(number) # Array with digits for checksum
  ```

## Debug

The gem if you included the gem, you can send a `ping` to the gem and expect `pong` back.

  ```ruby
  Luhn.ping # => 'pong'
  ```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
