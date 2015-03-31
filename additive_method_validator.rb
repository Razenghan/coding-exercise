class AdditiveMethodValidator
	def is_method_additive?(method, number)
		prime_numbers = find_prime_numbers(number)
		is_additive_for_primes?(method, prime_numbers)
	end

	private

	def find_prime_numbers(number)
		prime_numbers = []
		for i in 2..(number - 1)
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
		for x in prime_numbers
			secret_of_x = method.call(x)

			for y in prime_numbers
				secret_of_y = method.call(y)

				secret_of_x_and_y = method.call(x + y)
				# puts "Combination: #{x}, #{y}"
				# puts "x: #{secret_of_x}, y: #{secret_of_y}, x+y:#{secret_of_x_and_y}\n"
				if (secret_of_x + secret_of_y != secret_of_x_and_y)
					return false
				end
			end
		end

		return true
	end
end




