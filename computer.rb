require_relative 'board'
require_relative 'colorize'

# This class will store the computer's logic as CM and CB
class Computer
  @guess_index = 0
  @code = Array.new
  @correct_set = Array.new
  @bingo_colors = %w[red white]

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
    print " Computer is guessing the code"
    3.times do
      print '.'
      sleep(0.7)
    end

    while turn < 13
      if turn == 1
        # start off the guess by 4 reds, and go from there
        4.times do
          @code << Board.code_colors[@guess_index]
        end
        @guess_index += 1
        return @code
      elsif @correct_set.length != 4 && turn < 13
        # TODO: Need to make sure white feedback gets actually utilized
        # Currently if the number of red decreases, it assumes the worst

        # check the feedback on each guess. If correct, sort into the correct peg set
        if feedback[turn - 2].colors.count('red') > feedback[turn - 3].colors.count('red')
          self.reset_correct_set
          feedback[turn - 2].colors.each_with_index do |color, index|
            @correct_set << @code[index] if @bingo_colors.include?(color)
          end
        end
        self.reset_code
        @correct_set.each do |color|
          @code << color
        end
        @code << Board.code_colors[@guess_index] until @code.length == 4
        @guess_index += 1
        return @code
      elsif @correct_set.length == 4 && turn < 13
        # TODO: This needs to actually trigger either when feedback no longer include 'black'
        # or if we can properly reflect the correct_set with 4 values
        # shuffle the correct peg set of colors so the position can be found
        @correct_set.shuffle
      end
    end
  end

  def self.reset_code
    @code = []
  end

  def self.reset_correct_set
    @correct_set = []
  end
end
