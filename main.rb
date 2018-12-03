
# Evaluate the performance of participants using different guessing strategies

require_relative 'oracle.rb'
require_relative 'participant.rb'
require_relative 'play_randomly.rb'
require_relative 'play_linear.rb'
require_relative 'play_smart_random.rb'
require_relative 'play_binary_search.rb'

NUM_OF_RUNS = 8

oracle = Oracle.new

# evaluate random strategy
total_num_attempts = 0
total_num_failures = 0

choice = Kernel.rand(1..4)

case choice
when 1
  strategy = Play_randomly.new(oracle, max_num_attempts: NUM_OF_RUNS*2, lower: 1, upper: NUM_OF_RUNS)
  title = "randomly"
when 2
  strategy = Play_linear.new(oracle, max_num_attempts: NUM_OF_RUNS*2, lower: 1)
    title = "linear"
when 3
  strategy = Play_smart_random.new(oracle, max_num_attempts: NUM_OF_RUNS*2, lower: 1, upper: NUM_OF_RUNS)
  title = "smart"
  when 4
  strategy = Play_binary_search.new(oracle, max_num_attempts: NUM_OF_RUNS*2, lower: 1, upper: NUM_OF_RUNS)
  title = "binary search"
end

1.upto(NUM_OF_RUNS) do |i|
  oracle.secret_number = i
  participant = Participant.new
  participant.strategy = strategy
  if participant.start_play == :success
    # puts "play #{title} found #{i} in #{random.num_attempts} attempts"
    total_num_attempts += strategy.num_attempts
  else
    # puts "play #{title} failed to find #{i} after #{random.num_attempts} attempts"
    total_num_failures += 1
  end
end
puts "play #{title} took on average #{total_num_attempts/(NUM_OF_RUNS-total_num_failures)} attempts to succeed"
