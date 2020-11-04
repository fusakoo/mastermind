# This class will create a profile of player

require_relative 'computer'

# store player data (role)
class Player
  attr_accessor :role

  def initialize(role)
    @role = role
  end

  def create_code
    # let user create a code from 6 diff colors
    puts "user create code"
    secret_code = get_choice
  end

  def prompt_guess
    # let user guess a code
    puts "user guess code"
    get_choice
  end

  def get_choice
    1.times do
      choice = gets.chomp.downcase.split(" ")

      if choice.length != 4
        print "\nSorry, you have to select 4 colors. Try again: "
        redo
      end

      selectable_colors = Board.colors
      if !selectable_colors.include?(choice[0]) || !selectable_colors.include?(choice[1]) || !selectable_colors.include?(choice[2]) || !selectable_colors.include?(choice[3])
        print "\nYou can only enter the colors specified. Try again: "
        redo
      end
    end
  end

end
