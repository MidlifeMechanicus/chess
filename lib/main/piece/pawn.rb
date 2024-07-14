# Creates a Pawn piece.
require_relative "../piece"

class Pawn < Piece
  attr_accessor :has_moved

  def initialize(color, coordinates)
    @position = coordinates
    @color = color
    @display = set_display
    @matrix = [[0, 1], [0, 2], [1, 1], [-1, 1]].freeze
    # We call #freeze becasue we do not want to accidentally change this parameter.
    @has_moved = false
  end

  def set_display
    color == "black" ? "\e[38;2;255;0;0m♙\e[0m" : "\e[38;2;255;255;255m♙\e[0m"
  end
end
