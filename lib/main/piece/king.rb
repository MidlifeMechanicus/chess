# Creates a king piece.
require_relative "../piece"

class King < Piece
  def initialize(color, coordinates)
    @position = coordinates
    @color = color
    @display = set_display
    @matrix = [[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]].freeze
    # We call #freeze becasue we do not want to accidentally change this parameter.
  end

  def set_display
    color == "black" ? "\e[38;2;255;0;0m♔\e[0m" : "\e[38;2;255;255;255m♔\e[0m"
  end
end
