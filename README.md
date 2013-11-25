# Luhn check

With the luhn-check gem you can validate a number with the Luhn algoritme.

## Installation
### Version
`0.0.3`

###Gemfile

Since that the namespace in the `lib` directory is different than the name of the gem. You need to require the namespace of the class defined in the `lib` directory. 

Add this line to your application's Gemfile:

    gem 'luhn-check', '~> 0.0.3', require: 'luhn'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install luhn-check

## Usage

After the gem is installed. You can use this method to validate the number with the Luhn algoritme:

  ```ruby
  Luhn.valid?(number)
  ```


## Contributing
Pretty standard:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
