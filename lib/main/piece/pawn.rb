# Creates a Pawn piece.
require_relative "../piece"

class Pawn < Piece
  def initialize(color, coordinates)
    super
    @matrix = []
    # We DO NOT call #freeze because we will repeatedly change this parameter.
  end

  def set_display
    color == "black" ? "\e[38;2;255;0;0m♙\e[0m" : "\e[38;2;255;255;255m♙\e[0m"
  end

  def set_matrix(game)
    current_matrix = []
    column = position[0]
    row = position[1]
    if color == "black"
      if (row - 1).between?(0, 7) &&
         game.board[column][row - 1].nil?
        current_matrix << [0, -1]
        # Default move, but only in square unoccupied.
      end
      if has_moved == false &&
         (row - 2).between?(0, 7) &&
         game.board[column][row - 1].nil? &&
         game.board[column][row - 2].nil?
        current_matrix << [0, -2]
        # Initial move only, and only if both squares unoccupied.
      end
      if (column - 1).between?(0, 7) &&
         (row - 1).between?(0, 7) &&
         !game.board[column - 1][row - 1].nil? &&
         game.board[column - 1][row - 1].color == "white"
        current_matrix << [-1, -1]
      end
      if (column + 1).between?(0, 7) &&
         (row - 1).between?(0, 7) &&
         !game.board[column + 1][row - 1].nil? &&
         game.board[column + 1][row - 1].color == "white"
        current_matrix << [1, -1]
      end
      # Capture moves only available if enemy piece in relevant square.
    elsif color == "white"
      if (row + 1).between?(0, 7) &&
         game.board[position[0]][position[1] + 1].nil?
        current_matrix << [0, 1]
        # Default move, but only in square unoccupied.
      end
      if has_moved == false &&
         (row + 2).between?(0, 7) &&
         game.board[position[0]][position[1] + 1].nil? && game.board[position[0]][position[1] + 2].nil?
        current_matrix << [0, 2]
        # Initial move only, and only if both squares unoccupied.
      end
      if (column - 1).between?(0, 7) &&
         (row + 1).between?(0, 7) &&
         !game.board[column - 1][row + 1].nil? &&
         game.board[column - 1][row + 1].color == "black"
        current_matrix << [-1, 1]
      end
      if (column + 1).between?(0, 7) &&
         (row + 1).between?(0, 7) &&
         !game.board[column + 1][row + 1].nil? &&
         game.board[column + 1][row + 1].color == "black"
        current_matrix << [1, 1]
      end
      # Capture moves only available if enemy piece in relevant square.
    end
    # Still need en passant.
    @matrix = current_matrix
  end

  def possible_moves(game)
    # This function is unique to Pawns. Still need en passant.
    set_matrix(game)
    moves = matrix.map do |m|
      [position[0] + m[0], position[1] + m[1]]
    end
  end
  # Need promote method.
end
