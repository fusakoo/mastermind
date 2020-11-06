require_relative 'board'
require_relative 'colorize'

require 'colorize'

# store player data (role) and methods
class Player
  attr_accessor :role, :code
  include Colorization

  def initialize(role)
    @role = role
  end

  def create_code
    # let user create a code from 6 diff colors
    puts "\n --------------------------------------------------------------------"
    puts "\n You will now be setting the secret code computer will try to guess."
    puts " Enter a combination of 4 colors separated by space. You may repeat colors."
    puts " Your choices are: #{colorize_choices(Board.code_colors)}"
    puts " - Example code: #{colorize_choices(%w[red red blue cyan])}"
    print "\n Please enter your secret code: "
    input_guess
  end

  def prompt_guess
    # let user guess a code
    puts " Color options: #{colorize_choices(Board.code_colors)}"
    print " Codebreaker, what's your guess? "
    input_guess
  end

  def input_guess
    1.times do
      @code = gets.chomp.downcase.split(" ")

      if @code.length != 4
        print "\n Sorry, you have to select 4 colors. Try again: "
        redo
      end

      color_choices = Board.code_colors
      if !color_choices.include?(@code[0]) || !color_choices.include?(@code[1]) || !color_choices.include?(@code[2]) || !color_choices.include?(@code[3])
        print "\n You can only enter the colors specified. Try again: "
        redo
      end

      @code
    end
  end
end
