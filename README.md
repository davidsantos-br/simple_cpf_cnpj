# simple_cpf_cnpj

[![Gem Version](https://badge.fury.io/rb/simple_cpf_cnpj.svg)](https://rubygems.org/gems/simple_cpf_cnpj)
[![Build Status](https://travis-ci.org/davidsantos-br/simple_cpf_cnpj.svg)](https://travis-ci.org/davidsantos-br/simple_cpf_cnpj)
[![Code Climate](https://codeclimate.com/github/davidsantos-br/simple_cpf_cnpj/badges/gpa.svg)](https://codeclimate.com/github/davidsantos-br/simple_cpf_cnpj)
[![Test Coverage](https://codeclimate.com/github/davidsantos-br/simple_cpf_cnpj/badges/coverage.svg)](https://codeclimate.com/github/davidsantos-br/simple_cpf_cnpj/coverage)

The gem `simple_cpf_cnpj` provides the module CpfCnpj, which has utility
methods for dealing with CPFs and CNPJs.

A CPF is a Brazilian federal ID number issued to natural persons, and a CNPJ
is its counterpart for juridic persons (companies and the like).

The module provides methods to differentiate a CPF from a CNPJ, format,
and validate the numbers by verifying the check digits.

## Compatibility

The code is tested with Ruby (1.8.7, 1.9.2, 1.9.3, 2.0.0, 2.1, and 2.2), JRuby, and Ruby Enterprise Edition 1.8.7.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_cpf_cnpj'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install simple_cpf_cnpj
```

## Usage

The full documentation can be found at: http://docs.dsantosdev.com/simple_cpf_cnpj/

If necessary for your installation, add this to your code in the appropriate place:

```ruby
require 'simple_cpf_cnpj'
```

### CPF/CNPJ representation

The methods in this module expect CPFs/CNPJs to be passed as strings comprised only of
numeric characters. If the string you have is formatted, it's up to you to remove the punctuation before calling CpfCnpj methods.

Here's an example of how to do that:

```ruby
CpfCnpj.valid_cpf?(formatted_cpf.gsub(/\D/, ''))
```

### Validating CPFs and CNPJs
Use CpfCnpj.valid_cpf?, CpfCnpj.valid_cnpj?, or CpfCnpj.valid_cpf_cnpj? to
check if a number is valid.

```ruby
CpfCnpj.valid_cpf?("12345678900") # invalid
# => false
CpfCnpj.valid_cpf?("11026822840") # valid
# => true
CpfCnpj.valid_cnpj?("12345678000100") # invalid
# => false
CpfCnpj.valid_cnpj?("63871464000193") # valid
# => true
CpfCnpj.valid_cpf_cnpj?("11026822840") # valid CPF
# => true
CpfCnpj.valid_cpf_cnpj?("63871464000193") # valid CNPJ
# => true
```

### Formatting CPFs and CNPJs
Use CpfCnpj.format to get a formatted representation of a CPF or CNPJ.

```ruby
CpfCnpj.format("12345678987") # 11 characters (CPF)
# => "123.456.789-87"
CpfCnpj.format("01234567000198") # 14 characters (CNPJ)
# => "01.234.567/0001-98"
```

### Telling CPFs and CNPJs apart
Use CpfCnpj.type_of to determine if a number is a CPF or a CNPJ. Note that
this check is only based on the length of the string. The actual characters in
the string aren't checked at all.

```ruby
CpfCnpj.type_of("12345678987") # 11 characters
# => :cpf
CpfCnpj.type_of("123456789876") # 12 characters
# => nil
CpfCnpj.type_of("01234567000198") # 14 characters
# => :cnpj
```

## Development

**Note:** this is not necessary in order to use the gem, only to make changes
or run the included tests.

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `rake test` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/davidsantos-br/simple_cpf_cnpj.

## License and copyright

Copyright (c) 2015 David Santos

This software is released under the MIT license, which can be found in the
file [LICENSE](rdoc-ref:LICENSE).
