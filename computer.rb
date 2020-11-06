require_relative 'board'

# This class will store the computer's logic as CM and CB
class Computer
  class << self
    attr_accessor :secret_code
  end

  def self.generate_code
    puts " Computer is generating the code..."
    @secret_code = Array.new

    4.times do
      random_color = Board.code_colors.sample
      @secret_code << random_color
    end
    # computer generate a random code (1296 variations)
  end

  def self.guess_code
    print " Computer is guessing the code..."

    # return choice
    # using algorithm, computer guess the code
  end
end
