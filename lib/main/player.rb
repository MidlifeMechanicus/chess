# Creates a player to move Pieces.
require_relative "player/check"
require_relative "player/move"

class Player
  attr_accessor :color, :name, :currently_in_check

  def initialize(color)
    @color = color
    @name = color.capitalize
    @currently_in_check = false
  end

  def move_piece(game)
    # This method regulates the relationship between the movement related functions.

    move_accepted = false
    chosen_piece = nil

    until move_accepted == true
      game.show_board

      move = get_move.downcase.tr("1-8", "0-7").tr("a-h", "0-7").each_char.map(&:to_i)
      # This line converts from conventional chess notation to array coordinates.

      puts "That command was not understood. Please try again." unless move_format(move) == true

      puts "That is not one of your pieces. Please try again" unless piece_valid(game, move) == true

      chosen_piece = game.board[move[0]][move[1]]

      move_accepted = true if move == [7, 7, 7, 7]
      # Temporary escape
    end
    # GET

    # DO
    #
    puts "well done!"
    # make_move(game, move)
  end

  def show_instructions
    puts "Holding message"
    get_move
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
  include Move
end

# need get_help 'start-column-letter start-row-number end-column-letter end-column-number', with no spaces. /n
# For example: 'b1c3' would be a valid starting move for the white queens-knight."
