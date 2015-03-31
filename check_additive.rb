# -- Requirement --
# You are given a function 'secret()' that accepts a single integer parameter
# and returns an integer. In your favorite programming language, write a 
# command-line program that takes one command-line argument (a number) and determines 
# if the secret() function is additive [secret(x+y) = secret(x) + secret(y)], for all 
# combinations x and y, where x and y are all prime numbers less than the number passed 
# via the command-line argument.  Describe how to run your examples.”

# -- Developer note --
# It doesn't matter what secret() does here...its implementation can be anything,
# our goal is to simply determine if it is "additive", or satisfying the following:
# "func(x) + func(y) == func(x+y)"
require 'pry'

secret = Proc.new { |input|
	input 
}

class AdditiveMethodValidator

	def is_method_additive?(method, number)
		prime_numbers = find_prime_numbers(number)
		is_additive_for_primes?(method, prime_numbers)
		# (method.call(x) + method.call(y) == method.call(x + y))? true : false
	end

	private

	def find_prime_numbers(number)
		prime_numbers = []
		for i in 1..(number - 1)
			if is_prime?(i)
				prime_numbers << i
			end
		end

		return prime_numbers	
	end

	def is_prime?(number)
		for divisor in 2..(number - 1)
			if (number % divisor) == 0
				return false
			end
		end

		return true
	end

	def is_additive_for_primes?(method, prime_numbers)
		binding.pry
		for x in prime_numbers
			secret_of_x = method.call(x)

			for y in prime_numbers
				secret_of_y = method.call(y)

				secret_of_x_and_y = method.call(x + y)
				puts "Combination: #{x}, #{y}"
				puts "#{secret_of_x}, #{secret_of_y}, #{secret_of_x_and_y}\n"
				if (secret_of_x + secret_of_y != secret_of_x_and_y)
					return false
				end
			end
		end

		return true
	end
end

puts "Enter an integer:"
std_input = STDIN.gets.chomp
number_input = std_input.gsub(/\D/, '').to_i	# scrub the input for non-integer values

validator = AdditiveMethodValidator.new
return validator.is_method_additive?(secret, number_input)




