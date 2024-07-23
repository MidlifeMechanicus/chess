# Creates a Knight piece.
require_relative "../piece"

class Knight < Piece
  def initialize(color, coordinates)
    super
    @matrix = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]].freeze
    # We call #freeze becasue we do not want to accidentally change this parameter.
  end

  def set_display
    color == "black" ? "\e[38;2;255;0;0m♞\e[0m" : "\e[38;2;255;255;255m♞\e[0m"
  end

  def possible_moves(_game)
    # This function is specific for Knights.
    moves = matrix.map do |m|
      [position[0] + m[0], position[1] + m[1]]
    end
    moves.keep_if do |m|
      m if m[0].between?(0, 7) && m[1].between?(0, 7)
    end
  end
end
