class Play_template

  def reset
    @num_attempts = 0
  end

  def within_max_attempt?
    if (@num_attempts <= @max_num_attempts)
      # puts "#{__method__}: Yippee, I guessed #{num} and won!"
      :success
    else
      fail
    end
  end

  def increment_num_attempt
    @num_attempts+=1
  end

  def correct_guess? num
    @oracle.is_this_the_number?(num)==:correct
  end

  def num_attempts
    @num_attempts
  end

  def change_range result, num
    if result == :less_than
      @upper = num-1
    elsif result == :greater_than
      @lower = num+1
    end
  end

  def fail
    # puts "Boo hoo. I made #{@num_attempts} attempts and failed."
    :fail
  end
end