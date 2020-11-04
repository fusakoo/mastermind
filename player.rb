# This class will create a profile of player

require_relative 'computer'

# store player data (role)
class Player
  attr_accessor :role

  class << self
    attr_accessor :secret_code
  end

  def initialize(role)
    @role = role
  end

  def create_code
    # let user create a code from 6 diff colors
    puts "\nYou will now be setting the secret code computer will try to guess."
    puts "Enter a combination of 4 colors separated by space. You may repeat colors."
    puts "Your choices are: red, orange, blue, teal, green, and purple."
    puts "- Example code: 'red red blue teal'"
    print "\nPlease enter your secret code: "
    @secret_code = get_choice
  end

  def prompt_guess
    # let user guess a code
    puts @Player.role == 'codebreaker' ? "\n What's your guess?" : "\n Computer, what's your guess?"
    get_choice
  end

  def get_choice
    1.times do
      choice = gets.chomp.downcase.split(" ")

      if choice.length != 4
        print "\nSorry, you have to select 4 colors. Try again: "
        redo
      end

      color_choices = Board.code_colors
      if !color_choices.include?(choice[0]) || !color_choices.include?(choice[1]) || !color_choices.include?(choice[2]) || !color_choices.include?(choice[3])
        print "\nYou can only enter the colors specified. Try again: "
        redo
      end
    end
  end
end
