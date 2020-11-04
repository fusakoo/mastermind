require_relative 'feedback'
require_relative 'code'
require_relative 'computer'
require_relative 'player'

# utilize the colorize gem
require 'colorize'

# This class will create the board w/ nested array
# Also display the board for user to see while playing
class Board
  attr_accessor :solution, :guesses, :feedback
  @code_colors = %w[red orange blue teal green purple]

  class << self
    attr_accessor :code_colors
  end

  def initialize
    @solution = solution
    @guesses = Array.new(12, Code.new('white', 'white', 'white', 'white'))
    @feedback = Array.new(12, Feedback.new('white', 'white', 'white', 'white'))
    # create an array for the board
  end

  def display_board
    # display the current board status
    puts "     ____________________   + reflects the guesses"
    puts "    [                    ]  * reflects the feedback"
    @guesses.each_with_index do |guess, index|
      if index > 8
        puts " #{index + 1} | #{colorize(guess, true)} || #{colorize(@feedback[index], false)} |"
      else
        puts " #{index + 1}  | #{colorize(guess, true)} || #{colorize(@feedback[index], false)} |"
      end
    end
    puts "    [____________________]"
  end

  def colorize(array, is_code)
    colors = []
    symbol = is_code ? "+" : "*"
    array.colors.each { |color| colors.push(symbol.public_send(color.to_sym)) }
    colors.join(" ")
  end
end
