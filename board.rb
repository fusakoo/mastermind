require_relative 'feedback'
require_relative 'code'
require_relative 'computer'
require_relative 'player'
require_relative 'colorize'

# This class will create the board w/ nested array
# Also display the board for user to see while playing
class Board
  attr_accessor :solution, :guesses, :feedback
  @code_colors = %w[red yellow blue cyan green magenta]
  include Colorization

  class << self
    attr_accessor :code_colors
  end

  def initialize
    @solution = solution
    @guesses = Array.new(12, Code.new('white', 'white', 'white', 'white'))
    @feedback = Array.new(12, Feedback.new('black', 'black', 'black', 'black'))
    # create an array for the board
  end

  def display_board
    # display the current board status
    puts "\n       ____________________   + reflect the guesses"
    puts "      [                    ]  * reflect the feedback"
    @guesses.each_with_index do |guess, index|
      if index > 8
        puts "  #{index + 1}  | #{colorize_display(guess, true)} || #{colorize_display(@feedback[index], false)} |"
      else
        puts "  #{index + 1}   | #{colorize_display(guess, true)} || #{colorize_display(@feedback[index], false)} |"
      end
    end
    puts "      [____________________]"
  end

  def update_board(turn)
    check_guess(turn)
    display_board
    puts "\n #{@correct_pegs} peg(s) in the correct position and correct color." if @correct_pegs > 0
    puts " #{@wrong_position_pegs} peg(s) in the correct color BUT wrong position." if @wrong_position_pegs > 0
    puts "\n None of the colors matched those from the secret code. Try again." if @correct_pegs < 1 && @wrong_position_pegs < 1
  end

  def check_guess(turn)
    @current_guess = Array.new(@guesses[turn].colors)
    @temporary_solution = Array.new(@solution)

    check_correct_pegs(turn)
    check_wrong_pegs

    pegs = []
    @correct_pegs.times { pegs << 'red' }
    @wrong_position_pegs.times { pegs << 'white' }
    pegs << 'black' until pegs.length == 4

    @feedback[turn] = Feedback.new(pegs[0], pegs[1], pegs[2], pegs[3])
  end

  def check_correct_pegs(turn)
    @correct_pegs = 0

    @guesses[turn].colors.each_with_index do |color, index|
      if @solution[index] == color
        @current_guess[index] = nil
        @temporary_solution[index] = nil
        @correct_pegs += 1
      end
    end
  end

  def check_wrong_pegs
    @current_guess = @current_guess.compact
    @temporary_solution = @temporary_solution.compact
    @wrong_position_pegs = @temporary_solution.intersection(@current_guess).length
  end
end
