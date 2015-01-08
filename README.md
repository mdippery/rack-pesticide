# Rack Pesticide

Rack Pesticide blocks annoying and shady crawlers and websites that pollute
your logs with their HTTP referrer information.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-pesticide', :git => 'https://github.com/mdippery/rack-pesticide.git'

And then execute:

    $ bundle

## Usage

Simply add these two lines of code to your `config.ru` file:

    require 'rack-pesticide'
    use Rack::Pesticide

## Contributing

1. [Fork it](http://github.com/mdippery/rack-pesticide/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request
