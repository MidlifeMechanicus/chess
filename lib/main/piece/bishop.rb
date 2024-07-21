# Creates a Bishop piece.
require_relative "../piece"

class Bishop < Piece
  def initialize(color, coordinates)
    super
    @matrix = [[1, 1], [1, -1], [-1, -1], [-1, 1]]
    # We call #freeze becasue we do not want to accidentally change this parameter.
  end

  def set_display
    color == "black" ? "\e[38;2;255;0;0m♝\e[0m" : "\e[38;2;255;255;255m♝\e[0m"
  end
end
