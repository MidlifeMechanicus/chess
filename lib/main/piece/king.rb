# Creates a King piece.
require_relative "../piece"

class King < Piece
  def initialize(color, coordinates)
    super
    @matrix = []
    # We DO NOT call #freeze because we will repeatedly change this parameter.
  end

  def set_display
    color == "black" ? "\e[38;2;255;0;0m♚\e[0m" : "\e[38;2;255;255;255m♚\e[0m"
  end

  def set_matrix(game)
    current_matrix = [[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]]
    if color == "black" && game.current_player.color == "black"
      current_matrix << [-2, 0] if has_moved == false &&
      !game.board[0][7].nil? &&
                                   game.board[0][7].has_moved == false &&
                                   game.board[1][7].nil? &&
                                   game.board[2][7].nil? &&
                                   game.board[3][7].nil? &&
                                   game.current_player.check_check(game) == false &&
                                   game.current_player.check_check(game, [2, 7]) == false &&
                                   game.current_player.check_check(game, [3, 7]) == false
      # Castle Queenside
      current_matrix << [2, 0] if has_moved == false &&
      !game.board[7][7].nil? &&
                                  game.board[7][7].has_moved == false &&
                                  game.board[5][7].nil? &&
                                  game.board[6][7].nil? &&
                                  game.current_player.check_check(game) == false &&
                                  game.current_player.check_check(game, [5, 7]) == false &&
                                  game.current_player.check_check(game, [6, 7]) == false
      # Castle Kingside
    elsif color == "white" && game.current_player.color == "white"
      current_matrix << [-2, 0] if has_moved == false &&
      !game.board[0][0].nil? &&
                                   game.board[0][0].has_moved == false &&
                                   game.board[1][0].nil? &&
                                   game.board[2][0].nil? &&
                                   game.board[3][0].nil? &&
                                   game.current_player.check_check(game) == false &&
                                   game.current_player.check_check(game, [2, 0]) == false &&
                                   game.current_player.check_check(game, [3, 0]) == false
      # Castle Queenside
      current_matrix << [2, 0] if has_moved == false &&
      !game.board[7][0].nil? &&
                                  game.board[7][0].has_moved == false &&
                                  game.board[5][0].nil? &&
                                  game.board[6][0].nil? &&
                                  game.current_player.check_check(game) == false &&
                                  game.current_player.check_check(game, [5, 0]) == false &&
                                  game.current_player.check_check(game, [6]) == false
      # Castle Queenside
    end
    @matrix = current_matrix
  end

  def possible_moves(game)
    # This function is specific for Kings.
    set_matrix(game)
    moves = matrix.map do |m|
      [position[0] + m[0], position[1] + m[1]]
    end
    moves.keep_if do |m|
      m if m[0].between?(0, 7) && m[1].between?(0, 7)
    end
  end
end
