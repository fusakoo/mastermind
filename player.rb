# This class will create a profile of player

# store player data (role)
class Player
  attr_accessor :role

  def initialize(role)
    @role = role
  end

  def create_code
    # let user create a code from 6 diff colors

    secret_code = prompt_guess
  end

  def prompt_guess
    # let user guess a code
    guess = gets.chomp.downcase.split(" ")
  end
end
