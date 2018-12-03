
require_relative 'oracle.rb'
require_relative 'play_template.rb'

# Tries to guess the 'secret' number using several different strategies
class Play_randomly < Play_template
  attr_accessor :num_attempts

  def initialize(oracle, max_num_attempts:10, lower:0, upper:0)
    @oracle, @max_num_attempts = oracle, max_num_attempts
    @num_attempts = 0
    @lower = lower
    @upper = upper
  end

  def play
    while (@num_attempts <= @max_num_attempts) do
      increment_num_attempt
      break if correct_guess? guess_num
    end
    within_max_attempt?
  end

  def guess_num
    num = Kernel.rand(@lower..@upper).to_i
  end

end