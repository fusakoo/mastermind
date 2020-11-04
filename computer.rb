# This class will store the computer's logic as CM and CB

require_relative 'board'

class Computer
  def self.generate_code
    puts "comp generates code"

    @secret_code = Array.new()
    4.times do
      random_color = Board.colors.sample
      @secret_code << random_color
    end

    puts "Secret code is #{@secret_code}"
    # computer generate a random code (1296 variations)
  end

  def self.guess_code
    puts "comp guess code"
    # using algorithm, computer guess the code
  end
end
