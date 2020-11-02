# This class will create the board w/ nested array
# Also display the board for user to see while playing

require_relative 'feedback'

class Board
  def initialize
    #@secret_code = code.new
    #@guesses = Array.new(12, code.new)
    @feedback = Array.new(12, Feedback.new("white", "white", "white", "white"))
    # create an array for the board
  end

  def display_board
    # display the current board status
  end
end
