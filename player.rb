# This class will create a profile of player

# store player data (name, role)
class Player
  attr_accessor :name, :role

  def initialize(name, role)
    @name = name
    @role = role
  end

  def create_code
    # let user create a code from 6 diff colors
  end

  def prompt_guess
    # let user guess a code
  end
end

# This class will store the computer's logic as CM and CB

class Computer
  def generate_code
    # computer generate a random code (1296 variations)
  end

  def guess_code
    # using algorithm, computer guess the code
  end
end
