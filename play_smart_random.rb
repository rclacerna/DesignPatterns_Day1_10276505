require_relative 'oracle.rb'
require_relative 'play_template.rb'

  class Play_smart_random < Play_template
    attr_accessor :num_attempts

    def initialize(oracle, max_num_attempts:10, lower:0, upper:0)
      @oracle, @max_num_attempts = oracle, max_num_attempts
      @num_attempts = 0
      @lower = lower
      @upper = upper
    end

    def play
      while (@num_attempts <= @max_num_attempts) do
        num = guess_num
        increment_num_attempt
        result = correct_guess? num
        break if result
        change_range result, num
      end
      within_max_attempt?
    end

    def guess_num
      num = Kernel.rand(@lower..@upper).to_i
    end

  end