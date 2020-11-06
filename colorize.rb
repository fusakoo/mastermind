# utilize the colorize gem
require 'colorize'

# module to contain all colorize gem methods
module Colorization
  def colorize_display(array, is_code_peg)
    colors = []
    symbol = is_code_peg ? "+" : "*"
    array.colors.each { |color| colors.push(symbol.public_send(color.to_sym)) }
    colors.join(" ")
  end

  def colorize_choices(array)
    colors = []
    array.each { |color| colors.push(color.public_send(color.to_sym)) }
    colors.join(" ")
  end

  def colorize_string(string, color)
    colors = []
    colors.push(string.public_send(color.to_sym))
    colors.join(" ")
  end
end
