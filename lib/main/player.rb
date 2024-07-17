# Creates a player to move Pieces.
require_relative "player/check"

class Player
  attr_accessor :color, :name, :currently_in_check

  def initialize(color)
    @color = color
    @name = color.capitalize
    @currently_in_check = false
  end

  def move_piece(game)
    # GET
    move = [3, 0, 3, 1]
    # This is a temporary input
    # CHECK
    start = [move[0], move[1]]
    stop = [move[2], move[3]]
    piece = game.board[move[0]][move[1]]

    # DO
    make_move(game, move)
  end

  def get_move
    puts "Player #{name}, please enter your move, or enter 'help' for more information."
    move = gets.chomp.downcase
    case move
    when "help"
      show_instructions
    else
      check_move(move)
    end
  end

  def show_instructions
    puts "Holding message"
    # get_move
  end

  def check_move(move)
    # game, piece, stop
    #
    # TWO QUIESTIONS: IS FORMAT VALID? IS PIECE VALID?
    # THATS IT
    # RENAME?
    # if piece.restrict_to_board(piece.possible_moves).include?(stop)
    #   true
    # else
    #   false
    # end
    #
    puts "Cool"
  end

  def make_move(game, move)
    # move_array in the format [start_column, start_row, end_column, end_row]
    piece = game.board[move[0]][move[1]]
    move_square = [move[2], move[3]]

    return unless piece.restrict_to_board(piece.possible_moves).include?(move_square)

    game.board[move[2]][move[3]] = piece
    game.board[move[0]][move[1]] = nil
  end

  include Check
end

# need get_help 'start-column-letter start-row-number end-column-letter end-column-number', with no spaces. /n
# For example: 'b1c3' would be a valid starting move for the white queens-knight."
