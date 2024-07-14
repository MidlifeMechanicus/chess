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
    game.board[move[2]][move[3]] = game.board[move[0]][move[1]]
    game.board[move[0]][move[1]] = nil
  end
end

# need get_help 'start-column-letter start-row-number end-column-letter end-column-number', with no spaces. /n
# For example: 'b1c3' would be a valid starting move for the white queens-knight."
