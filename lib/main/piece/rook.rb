# Creates a Rook piece.
require_relative "../piece"

class Rook < Piece
  def initialize(color, coordinates)
    @position = coordinates
    @color = color
    @display = set_display
    @matrix = get_rook_matrix.freeze
    # We call #freeze becasue we do not want to accidentally change this parameter.
  end

  def set_display
    color == "black" ? "\e[38;2;255;0;0m♜\e[0m" : "\e[38;2;255;255;255m♜\e[0m"
  end

  def get_rook_matrix
    base_matrix = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    range = [1, 2, 3, 4, 5, 6, 7]
    matrix = range.map do |r|
      base_matrix.map { |m| [m[0] * r, m[1] * r] }
    end
    matrix.flatten(1)
  end
end
