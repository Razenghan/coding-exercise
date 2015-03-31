require 'pry'
require_relative '../additive_method_validator.rb'

RSpec.configure do |config|
  config.formatter = :documentation   # Output the test names
end

describe 'AdditiveMethodValidator' do
  let(:obj_implementing_secret) { Object.new }
  let(:validator) { AdditiveMethodValidator.new }

  describe '#is_method_additive?' do
    context 'for a linear function' do
      before(:each) do
        obj_implementing_secret.extend LinearFunctions
      end

      it 'should be additive for small primes' do
        small_input = 7
        is_additive = validator.is_method_additive?(obj_implementing_secret.method(:secret),
                                                    small_input)

        expect(is_additive).to be true
      end

      it 'should be additive for large primes' do
        large_input = 5000
        is_additive = validator.is_method_additive?(obj_implementing_secret.method(:secret),
                                                    large_input)

        expect(is_additive).to be true
      end
    end

    context 'for a non-linear function' do
      before(:each) do
        obj_implementing_secret.extend NonLinearFunctions
      end

      it 'should not be additive for small primes' do
        small_input = 2
        is_additive = validator.is_method_additive?(obj_implementing_secret.method(:secret),
                                                    small_input)

        expect(is_additive).to be true
      end

      it 'should not be additive for large primes' do
        large_input = 5000
        is_additive = validator.is_method_additive?(obj_implementing_secret.method(:secret),
                                                    large_input)

        expect(is_additive).to be false
      end
    end
  end
end

module LinearFunctions
  def secret(x)
    return x * 2  # Example of a linear function, which is additive
  end
end

module NonLinearFunctions
  def secret(x)
    return x * x  # Example of a non-linear (logarithmic) function, NOT additive
  end
end
