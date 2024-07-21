# Creates a King piece.
require_relative "../piece"

class King < Piece
  def initialize(color, coordinates)
    super
    @matrix = [[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]].freeze
    # We call #freeze becasue we do not want to accidentally change this parameter.
  end

  def set_display
    color == "black" ? "\e[38;2;255;0;0m♚\e[0m" : "\e[38;2;255;255;255m♚\e[0m"
  end

  def possible_moves(game)
    # This function is specific for Kings.
    moves = matrix.map do |m|
      [position[0] + m[0], position[1] + m[1]]
    end
    moves.keep_if do |m|
      m if m[0].between?(0, 7) && m[1].between?(0, 7)
    end
    # Still needs check-checker.
  end
end
