#!/usr/bin/ruby

class SomethingThatImplementSecret
	# We need SOMETHING to implement secret...
	# let's just make a linear function
	def secret(input)
		return input + 1
	end
end

def get_prime_numbers(input)
	prime_numbers = []
	for i in 1..(input - 1)
		if is_prime?(i)
			prime_numbers << i
		end
	end
	return prime_numbers	
end

private

def is_secret_additive_for_our_input?(prime_numbers)
	for x in prime_numbers
		secret_of_x = secret(x)

		for y in prime_numbers
			secret_of_y = secret(y)

			secret_of_x_and_y = secret(x + y)
			puts "Combination: #{x}, #{y}"
			puts "#{secret_of_x}, #{secret_of_y}, #{secret_of_x_and_y}\n"
			if (secret_of_x + secret_of_y != secret_of_x_and_y)
				return false
			end
		end
	end
	return true
end

def is_prime?(input)
  for divisor in 2..(input - 1)
    if (input % divisor) == 0
      return false
    end
  end
  return true
end

puts "Enter an integer:"
# Read from standard input
cmd_input = STDIN.gets.chomp
# scrub the input for non-integer values
scrubbed_input = cmd_input.gsub(/\D/,'').to_i
puts "scrubbed input: #{scrubbed_input}"

prime_numbers = get_prime_numbers(scrubbed_input)
puts "PRIME NUMBERS: #{prime_numbers}"

puts "--- IS ADDITIVE? #{is_secret_additive_for_our_input?(prime_numbers)}"




