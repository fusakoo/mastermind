require_relative 'board'
require_relative 'colorize'

# This class will store the computer's logic as CM and CB
class Computer
  @guess_index = 0
  @code = []
  @correct_set = []
  @past_shuffle = []
  @bingo_colors = %w[red white]

  class << self
    attr_accessor :secret_code, :code
  end

  def self.generate_code
    print ' Computer is generating the code'
    print_dots
    @secret_code = []

    4.times do
      random_color = Board.code_colors.sample
      @secret_code << random_color
    end

    puts ' Alright, let the game begin!'
    sleep(1)
    # computer generate a random code (1296 variations)
  end

  def self.guess_code(feedback, turn)
    print ' Computer is guessing the code'
    print_dots

    while turn < 13
      current_turn = feedback[turn - 2].colors

      if turn == 1
        # start off the guess by 4 reds, and go from there
        try_different_color
      elsif @shuffle_guesses
        shuffle_code
      elsif current_turn.include?('black')
        # check the feedback on each guess.
        # if correct, sort into the correct peg set & try the next color
        update_correct_set(feedback, turn)
        reset_code
        update_code
        try_different_color
      else
        @shuffle_guesses = true
        @past_shuffle << @code
        shuffle_code
      end
      return @code
    end
  end

  def self.shuffle_code
    @code = @code.shuffle while @past_shuffle.include?(@code)
    @past_shuffle << @code
  end

  # helper method to count multiple values in array
  def self.count_all(array, values_to_count)
    array.count { |value| values_to_count.include?(value) }
  end

  def self.update_correct_set(feedback, turn)
    current_turn = feedback[turn - 2].colors
    previous_turn = feedback[turn - 3].colors
    if count_all(current_turn, @bingo_colors) > count_all(previous_turn, @bingo_colors)
      reset_correct_set
      current_turn.each_with_index do |color, index|
        @correct_set << @code[index] if @bingo_colors.include?(color)
      end
    end
    @correct_set
  end

  def self.update_code
    @correct_set.each do |color|
      @code << color
    end
  end

  def self.reset_correct_set
    @correct_set = []
  end

  def self.reset_code
    @code = []
  end

  def self.try_different_color
    @code << Board.code_colors[@guess_index] until @code.length == 4
    @guess_index += 1
  end

  def self.print_dots
    3.times do
      print '.'
      sleep(0.6)
    end
  end
end
