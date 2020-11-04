# This class will create the board w/ nested array
# Also display the board for user to see while playing

require_relative 'feedback'
require_relative 'code'
require_relative 'computer'

class Board
  attr_accessor :solution, :guesses, :feedback
  @colors = ["red", "orange", "blue", "teal", "green", "purple"]

  class << self
    attr_accessor :colors
  end

  def initialize
    @solution = @secret_code
    @guesses = Array.new(12, Code.new("white", "white", "white", "white"))
    @feedback = Array.new(12, Feedback.new("white", "white", "white", "white"))
    # create an array for the board
  end

  def display_board
    # display the current board status
  end
end
