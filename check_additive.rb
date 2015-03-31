#!/usr/bin/ruby
require_relative 'additive_method_validator.rb'

# -- Requirement --
# You are given a function 'secret()' that accepts a single integer parameter
# and returns an integer. In your favorite programming language, write a 
# command-line program that takes one command-line argument (a number) and determines 
# if the secret() function is additive [secret(x+y) = secret(x) + secret(y)], for all 
# combinations x and y, where x and y are all prime numbers less than the number passed 
# via the command-line argument.  Describe how to run your examples.”

# -- Developer note --
# It doesn't matter what secret() does here...its implementation can be anything.
# The goal is determine if it is "additive", or satisfying the following:
# "func(x) + func(y) == func(x+y)"
secret = Proc.new { |input|
	input * 2
}

puts "Enter an integer:"
std_input = STDIN.gets.chomp
number_input = std_input.gsub(/\D/, '').to_i	# scrub the input for non-integer values

validator = AdditiveMethodValidator.new
is_additive = validator.is_method_additive?(secret, number_input)
puts "Q: Is the secret method additive, for primes less than your input?\nA: #{is_additive}"