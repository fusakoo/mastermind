require_relative 'board'

# This class will store the computer's logic as CM and CB
class Computer
  class << self
    attr_accessor :secret_code
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

  def self.guess_code
    print " Computer is guessing the code"
    3.times do
      print '.'
      sleep(0.7)
    end

    # return choice
    # using algorithm, computer guess the code
  end
end
