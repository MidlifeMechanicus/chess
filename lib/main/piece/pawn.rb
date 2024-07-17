# Creates a Pawn piece.
require_relative "../piece"

class Pawn < Piece
  def initialize(color, coordinates)
    @position = coordinates
    @color = color
    @display = set_display
    @matrix = set_matrix.freeze
    # We call #freeze becasue we do not want to accidentally change this parameter.
  end

  def set_display
    color == "black" ? "\e[38;2;255;0;0m♙\e[0m" : "\e[38;2;255;255;255m♙\e[0m"
  end

  def set_matrix
    color == "black" ? [[0, -1], [0, -2], [1, -1], [-1, -1]] : [[0, 1], [0, 2], [1, 1], [-1, 1]]
  end

  def possible_moves(game)
    # This function is unique to Pawns.
    moves = [[position[0] + matrix[0][0], position[1] + matrix[0][1]]]
    # Base move.
    moves << [position[0] + matrix[1][0], position[1] + matrix[1][1]] unless has_moved == true
    # Additional distance on first move.
    moves << [position[0] + matrix[2][0], position[1] + matrix[2][1]] unless
    game.board[position[0] + matrix[2][0]][position[1] + matrix[2][1]].nil?
    moves << [position[0] + matrix[3][0], position[1] + matrix[3][1]] unless
    game.board[position[0] + matrix[3][0]][position[1] + matrix[3][1]].nil?
    # Capture moves.
    #
    # Still need en passant.
    moves
  end
end
