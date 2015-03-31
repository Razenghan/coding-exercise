## Setup
- Clone this repository, `git clone git@github.com:Razenghan/coding-exercise.git`

  -- OR --
- Download and unzip from https://github.com/Razenghan/coding-exercise/archive/release-0.1.zip

## Running the console command
*Console program is written in Ruby*

1. Execute `ruby check_additive.rb`
2. Enter an integer.  The program will perform the following:
  * Defines a method (actually, a Proc) called `secret`, which returns a linear function
  * Finds all prime numbers less than your input
  * For each prime number combination (x,y), evaluates `secret(x) + secret(y) == secret(x+y)`
   - If all combinations (x,y) satisfies the above condition, the program prints `true`
   - If **any** combination (x,y) does *not* satisfy the above condition, the program prints `false`
   
## Running the test
*A test is provided, written in RSpec.  The console command above only implements the 'secret' method once, with a linear function that is always additive.  This test covers both linear and non-linear implementations, which are additive / non-additive, respectively*

1. Install RSpec and its dependencies, if needed:  `gem install rspec`
2. Execute `rspec spec/check_additive_spec.rb`  The test asserts the following:
  * When a `secret` method is linear, `AdditiveMethodValidator#is_method_additive?` should be TRUE for any prime numbers
  * When a `secret` method is non-linear, `AdditiveMethodValidator#is_method_additive?` should be FALSE for all prime numbers
