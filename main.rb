
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
random = Play_randomly.new(oracle, max_num_attempts: NUM_OF_RUNS*2, lower: 1, upper: NUM_OF_RUNS)

1.upto(NUM_OF_RUNS) do |i|
  oracle.secret_number = i
  participant = Participant.new
  participant.strategy = random
  if participant.start_play == :success
    # puts "play randomly found #{i} in #{random.num_attempts} attempts"
    total_num_attempts += random.num_attempts
  else
    # puts "play randomly failed to find #{i} after #{random.num_attempts} attempts"
    total_num_failures += 1
  end
end
puts "play randomly took on average #{total_num_attempts/(NUM_OF_RUNS-total_num_failures)} attempts to succeed"


# evaluate linear strategy
total_num_attempts = 0
total_num_failures = 0

linear = Play_linear.new(oracle, max_num_attempts: NUM_OF_RUNS*2, lower: 1)

1.upto(NUM_OF_RUNS) do |i|
  oracle.secret_number = i
  participant = Participant.new
  participant.strategy = linear

  if participant.start_play == :success
    # puts "play randomly found #{i} in #{random.num_attempts} attempts"
    total_num_attempts += linear.num_attempts
  else
    # puts "play randomly failed to find #{i} after #{random.num_attempts} attempts"
    total_num_failures += 1
  end

end
puts "play_linear took on average #{total_num_attempts/(NUM_OF_RUNS-total_num_failures)} attempts to succeed"


# evaluate 'smart random' strategy
total_num_attempts = 0
total_num_failures = 0
smart = Play_smart_random.new(oracle, max_num_attempts: NUM_OF_RUNS*2, lower: 1, upper: NUM_OF_RUNS)

1.upto(NUM_OF_RUNS) do |i|
  oracle.secret_number = i
  participant = Participant.new
  participant.strategy = smart

  if participant.start_play == :success
    # puts "play randomly found #{i} in #{random.num_attempts} attempts"
    total_num_attempts += smart.num_attempts
  else
    # puts "play randomly failed to find #{i} after #{random.num_attempts} attempts"
    total_num_failures += 1
  end

end

puts "play_smart_random took on average #{total_num_attempts/(NUM_OF_RUNS-total_num_failures)} attempts to succeed"

# evaluate binary search strategy
total_num_attempts = 0
total_num_failures = 0
binary = Play_binary_search.new(oracle, max_num_attempts: NUM_OF_RUNS*2, lower: 1, upper: NUM_OF_RUNS)

1.upto(NUM_OF_RUNS) do |i|
  oracle.secret_number = i
  participant = Participant.new
  participant.strategy = binary

  if participant.start_play == :success
    # puts "play randomly found #{i} in #{random.num_attempts} attempts"
    total_num_attempts += binary.num_attempts
  else
    # puts "play randomly failed to find #{i} after #{random.num_attempts} attempts"
    total_num_failures += 1
  end

end
puts "play_binary_search took on average #{total_num_attempts/(NUM_OF_RUNS-total_num_failures)} attempts to succeed"
