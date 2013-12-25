# Luhn check

[![Coverage Status](https://coveralls.io/repos/JanDintel/luhn-check/badge.png?branch=master)](https://coveralls.io/r/JanDintel/luhn-check?branch=master)
[![Build Status](https://travis-ci.org/JanDintel/luhn-check.png?branch=master)](https://travis-ci.org/JanDintel/luhn-check)

With the luhn-check gem you can validate a number with the Luhn algorithm.
This is commonly used to check validity of creditcard numbers and others.

## Installation

In your Gemfile:

```ruby
gem 'luhn-check', '~> 0.0.3', require: 'luhn'
```

Or:

    $ gem install luhn-check

## Usage

Validate a number:

```ruby
Luhn.valid?(number)              #=> true or false
Luhn.valid?(4539085529167499)    #=> true
```

## Troubleshooting

### Requirements of number
```ruby
LuhnError::RequirementError
```

The number you want to validate must be a least:

* From the `Fixnum` class
* Positive
* Not 0 (zero)

## Contributing
1. Fork
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new pull request
