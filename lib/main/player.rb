# Creates a player to move Pieces.
require "./lib/main/game"
require "./lib/main/piece"
require "./lib/main/piece/king"
require "./lib/main/piece/queen"
require "./lib/main/piece/bishop"
require "./lib/main/piece/knight"
require "./lib/main/piece/rook"
require "./lib/main/piece/pawn"
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

    # Need to check for check.

    move_accepted = false
    chosen_piece = nil

    until move_accepted == true
      game.show_board
      move = get_move
      move = filter_move_string(move)
      # This line converts from conventional chess notation to array coordinates.

      if move.length != 4
        puts "That command was not understood. Please try again."
      elsif piece_valid(game, move) != true
        puts "That is not one of your pieces. Please try again"
      elsif game.board[move[0]][move[1]].check_move_valid(game, [move[2], move[3]]) != true
        puts "That piece cannot move there. Please try again."
      # elsif move creates check
      else
        make_move(game, move)
        game.show_board
        move_accepted = true
      end
    end
    # SCOPE!!!!
    puts "well done!"
    # make_move(game, move)
  end

  def show_instructions
    puts "Holding message"
    get_move
  end

  include Check
  include Move
end

# need get_help 'start-column-letter start-row-number end-column-letter end-column-number', with no spaces. /n
# For example: 'b1c3' would be a valid starting move for the white queens-knight."
