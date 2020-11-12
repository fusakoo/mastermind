# Mastermind
# Codemaker: create 4 color (6^4 = 1296) combination (color can be repeated)
# Codebreaker: guess the secret code within 12 turns

require_relative 'player'
require_relative 'computer'
require_relative 'board'
require_relative 'feedback'
require_relative 'colorize'

class Mastermind
  attr_accessor :board, :turns, :code_colors
  include Colorization

  def initialize
    @board = Board.new
    @turns = 1
    @code_colors = Board.code_colors
  end

  def play
    ### Initialize the game
    introduction
    define_role
    set_secret_code
    turn until over?
    result
  end

  def introduction
    puts ' --------------------------------------------------------------------'
    puts ' ╔╦╗┌─┐┌─┐┌┬┐┌─┐┬─┐┌┬┐┬┌┐┌┌┬┐'
    puts ' ║║║├─┤└─┐ │ ├┤ ├┬┘│││││││ ││'
    puts ' ╩ ╩┴ ┴└─┘ ┴ └─┘┴└─┴ ┴┴┘└┘─┴┘'
    puts ' --------------------------------------------------------------------'
    sleep(2)
    explain_instruction
    explain_feedback

    @board.display_board
  end

  def explain_instruction
    puts "\n Play as the Codebreaker to guess the code, or"
    puts ' play as the Codemaker to create an unbreakable code!'
    puts "\n Both Player and Computer must guess the secret code within 12 turns to win."
    puts ' - Left side of the board displays the guesses to the code'
    puts ' - Right side will display the feedback to the guesses'
  end

  def explain_feedback
    puts "\n Feedback peg (*) reference: "
    puts " #{colorize_string('*', 'red')} Red: a guess is in the correct position and correct color"
    puts " #{colorize_string('*', 'white')} White: a guess is the correct color BUT in the wrong position"
    puts " #{colorize_string('*', 'black')} Black: a guess is neither correct in color / position"
  end

  def define_role
    # defines the player's name and role
    puts "\n --------------------------------------------------------------------"
    puts "\n Would you like to play as Codebreaker or Codemaker?"
    puts ' - Codebreaker: guess the secret code computer came up with'
    puts ' - Codemaker: come up with a secret code and computer will try to guess it'
    print "\n Type [1] for Codebreaker or [2] for Codemaker: "
    input = gets.chomp.to_i
    until input == 1 || input == 2
      print " Sorry, didn't catch that. \nType [1] for Codebreaker or [2] for Codemaker: "
      input = gets.chomp.to_i
    end

    assign_role(input)
    puts "\n Great, you will be #{@player.role.capitalize} for this game!"
  end

  def assign_role(input)
    if input == 1
      @player = Player.new('codebreaker')
    elsif input == 2
      @player = Player.new('codemaker')
    end
  end

  def set_secret_code
    if @player.role != 'codemaker'
      Computer.generate_code
      @board.solution = Computer.secret_code
      # Debug purpose only
      # puts " Secret code is #{colorize_choices(board.solution)}"
    else
      @player.create_code
      @board.solution = @player.code
      puts " Secret code is #{colorize_choices(board.solution)}"
    end
  end

  def turn
    puts "\n --------------------------------------------------------------------"
    puts "\n **Turn #{@turns}**"
    choice = ask_guess
    puts "\n Code has been entered: #{colorize_choices(choice)}"
    update_guess(choice)
    @turns += 1
  end

  def ask_guess
    if @player.role == 'codebreaker'
      @player.prompt_guess
      guess = @player.code
    else
      Computer.guess_code(board.feedback, @turns)
      guess = Computer.code
    end
    guess
  end

  def update_guess(choice)
    board.guesses[@turns - 1] = Code.new(choice[0], choice[1], choice[2], choice[3])
    board.update_board(@turns - 1)
  end

  def won?
    if @turns < 2
      false
    else
      board.guesses[@turns - 2].colors == board.solution
    end
  end

  def over?
    won? || @turns > 12
  end

  def result
    if won?
      puts "\n Codebreaker has cracked the secret code!"
    elsif @turns > 12
      puts "\n Codebreaker was unable to crack the code."
      puts " The secret code was: #{colorize_choices(board.solution)}"
      puts nil
    end
  end
end

game = Mastermind.new
game.play
