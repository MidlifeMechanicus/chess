# Creates a player to move Pieces.

class Player
  attr_accessor :color, :name

  def initialize(color)
    @color = color
    @name = color.capitalize
  end

  # def get_move
  #   puts "Player #{name}, please enter your move, or enter 'help' for more information."
  #   move = gets.chomp.downcase
  #   check_move(move)
  # end

  def check_move(move)
    move = move.chars
    # need several checks
    # check format
    # check if valid
    # separate module?
    # check color
    # check against piece
  end

  def make_move(game, move)
    # move_array in the format [start_column, start_row, end_column, end_row]
    piece = game.board[move[0]][move[1]]
    move_square = [move[2], move[3]]

    p move_square

    p piece.restrict_to_board(piece.possible_moves)

    return unless piece.restrict_to_board(piece.possible_moves).include?(move_square)

    game.board[move[2]][move[3]] = piece
    game.board[move[0]][move[1]] = nil
  end
end

# need get_help 'start-column-letter start-row-number end-column-letter end-column-number', with no spaces. /n
# For example: 'b1c3' would be a valid starting move for the white queens-knight."
