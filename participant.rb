require_relative 'oracle.rb'

# Tries to Participant the 'secret' number using several different strategies
class Participant
  attr_accessor :strategy

  def start_play
    @strategy.reset
    @strategy.play
  end

end