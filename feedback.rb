# class for feedback
# instances of this class will be each feedback provided on the guesses
class Feedback
  attr_accessor :colors

  def initialize(color1, color2, color3, color4)
    @colors = [color1, color2, color3, color4]
  end
end
