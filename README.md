# Luhn check

With the luhn-check gem you can validate a number with the Luhn algorithm.
This is commonly used to check validity of creditcard numbers and others.

Version
`0.0.3`

## Installation

In your Gemfile:

    gem 'luhn-check', '~> 0.0.3', require: 'luhn'

Or

    $ gem install luhn-check

## Usage

Validate a number:

  ```ruby
  Luhn.valid?(number)
  ```

## Contributing
1. Fork
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new pull request
