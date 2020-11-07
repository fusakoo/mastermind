require_relative 'board'
require_relative 'colorize'

# This class will store the computer's logic as CM and CB
class Computer
  # @@guess_index = 0
  # @@correct_combo = []

  class << self
    attr_accessor :secret_code, :code
  end

  def self.generate_code
    print " Computer is generating the code"
    3.times do
      print '.'
      sleep(0.7)
    end
    @secret_code = Array.new

    4.times do
      random_color = Board.code_colors.sample
      @secret_code << random_color
    end

    puts " Alright, let the game begin!"
    sleep(1)
    # computer generate a random code (1296 variations)
  end

  def self.guess_code(feedback, turn)
    # guess_combination = []

    # if @@correct_combo.length != 4
    #   case turn
    #   when 1
    #     2.times {guess_combination << Board.code_colors[@@guess_index]}
    #     2.times {guess_combination << Board.code_colors[@@guess_index + 1]}

    #     @@guess_index += 1
    #   when (2..8)

    print " Computer is guessing the code"
    3.times do
      print '.'
      sleep(0.7)
    end

    #temporary logic to test if the other dependencies are working
    @code = Array.new
    4.times do
      @code << Board.code_colors.sample
    end
  end
end
