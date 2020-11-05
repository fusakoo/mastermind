# Mastermind
# Codemaker: create 4 color combination (color can be repeated ; 6^4 = 1296 possibilities)
# Codebreaker: guess within 12 turns the combination

# 6 color codepegs: red, orange, blue, teal, green, purple
# Clues: ! for correct position/color, ? for correct color/wrong position, blank for incorrect
# - Q: should the feedback be provided in order, or at random? (if latter, need to randomnize response)

# Computer algorithm
# Codemaker: just create a random 4 color combination
# - need an algorithm to properly provide feedback/clues

# Codebreaker: can start off by 2-2 pattern

# Initial ideas
# 4 color combo will be an array (i.e. ["red", "red", "teal", "purple"]
# CPU as CM: Take user input with gets (either one color per line, or all at once)
# - store the user input into temporary array
# - reset the temporary array if not correct

# Gameplay
# 0. Ask player name & choice of role (be a 1.codebreaker or 2.codemaster)
#
# Phase1: vs CPU CM
# 1. Provide game instruction
# 2. Gets the user inputs for 4 guesses
#   - Convert inputs into array
# 3. Compare the user inputs with the code
# 4. Provide feedback/clues
#   - IF guessed correct, game is finished (go to step 6)
#   - ELSE loop 2,3,4 until 5
# 5. Once 12 turns/loops are complete, game over
# 6. Ask user to play again or not

# Phase2: vs CPU CB
# 1. Provide game instruction
# 2. Gets user input for the code
# 3. Run CPU guessing algorithm for first guess
#   - IF bot guesses correctly, game is finished (go to step 7)
# 4. Let user provide feedback
# 5. Run CPU guessing algorithm again
#   - IF bot guesses correctly, game is finished
#   - ELSE loop 3,4,5 until 6
# 6. If 12 turns pass (which shouldn't be possible, shoudl be able to guess within <5 turns), game over
#   - Edge case would be that the user kept on providing wrong feedback (prevent w/ repeated instruction)
# 7. Ask user to play again or not

require_relative 'player'
require_relative 'computer'
require_relative 'board'

require 'pry'

class Mastermind
  attr_accessor :board, :win, :turns, :colors

  def initialize
    @board = Board.new
    @win = false
    @turns = 1
    @code_colors = Board.code_colors
  end

  def play
    ### Initialize the game
    introduction
    define_role
    if @player.role != 'codemaster'
      Computer.generate_code
      @board.solution = Computer.secret_code
      puts " Secret code is #{@board.solution}"
    else
      Player.create_code
      @board.solution = Player.code
      puts " Secret code is #{@board.solution}"
    end
    # if player =/= CM, computer.generate_code
    # else, player.create_code
    turn until over?
  end

  def introduction
    puts " Introduction"
    @board.display_board
    # provide general overview of the game
  end

  def define_role
    # defines the player's name and role
    puts "\n Would you like to play as Codebreaker or Codemaster?"
    puts ' - Codebreaker will guess the code computer came up with'
    puts " - Codemaster will allow you to come up with a secret code computer will guess \n"
    print ' Type [1] for Codebreaker or [2] for Codemaker: '
    input = gets.chomp.to_i
    until input == 1 || input == 2
      print " Sorry, didn't catch that. \nType [1] for Codebreaker or [2] for Codemaker: "
      input = gets.chomp.to_i
    end

    if input == 1
      @player = Player.new('codebreaker')
    elsif input == 2
      @player = Player.new('codemaster')
    end
    puts "\n Great, you will be #{@player.role} for this game!"
  end

  def turn
    while @turns < 13
      puts "\n **Turn #{@turns}**"
      choice = ask_guess
      puts " You've entered #{choice}"
      update_guess(choice)
      @turns += 1
    end
    # guess
    # check guess
    # winner / won? / over?
  end

  def ask_guess
    if @player.role == 'codebreaker'
      Player.prompt_guess
      guess = Player.code
    else
      guess = Computer.guess_code
    end
    guess
  end

  def update_guess(choice)
    board.guesses[12 - @turns] = Code.new(choice[0], choice[1], choice[2], choice[3])
    board.update_board(12 - @turns)
  end

  def winner
    # if won? && not over?
  end

  def won?
    # have computer or player guessed the right combination?
  end

  def over?
    # has the game reached turn 12?
  end
end

game = Mastermind.new
game.play
