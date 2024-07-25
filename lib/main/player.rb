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
  attr_accessor :color, :name

  def initialize(color)
    @color = color
    @name = color.capitalize
  end

  def move_piece(game)
    # This method regulates the relationship between the movement related functions.

    if check_check(game) == true &&
       check_mate(game) == true
      puts "Checkmate. Player #{name} has been defeated."
      # Any end of game code here.
      return
    elsif check_mate(game) == true
      puts "Stalemate. Player #{name} is not in check, but has no legal moves. The game is a tie."
      # Any end of game code here.
      return
    elsif check_check(game) == true
      puts "Player #{name} is in check."
    else
      puts "It is Player #{name}'s move."
    end

    clear_en_passant(game)

    move_accepted = false

    until move_accepted == true || game.game_over == true
      game.show_board
      move = get_move(game)
      break if game.game_over == true || move.nil?

      move = filter_move_string(move)
      # This line converts from conventional chess notation to array coordinates.
      if move.length != 4
        puts "That command was not understood. Please try again."
      elsif piece_valid(game, move) != true
        puts "That is not one of your pieces. Please try again"
      elsif game.board[move[0]][move[1]].check_move_valid(game, [move[2], move[3]]) != true
        puts "That piece cannot move there. Please try again."
      else
        working_copy = Marshal.load(Marshal.dump(game))
        make_move(working_copy, move)
        if check_check(working_copy) == true
          puts "That move would put you in check. Please try again."
        else
          move_accepted = true
        end
      end
    end
    game.game_over = true if move.nil?
    return if game.game_over == true

    make_move(game, move)
    check_castle(game, move)
    check_en_passant(game, move)
    check_promotion(game)
    game.current_player, game.next_player = game.next_player, game.current_player
    game.show_board
  end

  def check_promotion(game)
    game.board.each.with_index do |column, _i|
      column.each.with_index do |square, _j|
        next unless square.class == Pawn && square.color == color

        square.promote(game)
      end
    end
  end

  def check_en_passant(game, move)
    return unless game.board[move[2]][move[3]].instance_of?(Pawn)

    if move[0] - move[2] == 0 &&
       move[1] - move[3] == 2.abs
      game.board[move[2]][move[3]].en_passant = true
      # Marks pawn as en passant
    elsif game.board[move[2]][move[3]].color == "black" &&
          game.board[move[2]][move[3] + 1 ].instance_of?(Pawn) &&
          game.board[move[2]][move[3] + 1 ].color != color &&
          game.board[move[2]][move[3] + 1 ].en_passant == true
      game.board[move[2]][move[3] + 1 ] = nil
      # Removes white pawns taken en passant
    elsif game.board[move[2]][move[3]].color == "white" &&
          game.board[move[2]][move[3] - 1 ].instance_of?(Pawn) &&
          game.board[move[2]][move[3] - 1 ].color != color &&
          game.board[move[2]][move[3] - 1 ].en_passant == true
      game.board[move[2]][move[3] - 1 ] = nil
      # Removes black pawns taken en passant
    end
  end

  def clear_en_passant(game)
    game.board.each.with_index do |column, _i|
      column.each.with_index do |square, _j|
        next unless square.class == Pawn && square.color == color

        square.en_passant = false
      end
    end
  end

  def check_castle(game, move)
    if move == [4, 7, 2, 7] && game.board[2][7].instance_of?(King)
      game.board[3][7] = game.board[0][7]
      game.board[3][7].has_moved = true
      game.board[0][7] = nil
      # Black castle Queenside
    elsif move == [4, 7, 6, 7] && game.board[6][7].instance_of?(King)
      game.board[5][7] = game.board[7][7]
      game.board[5][7].has_moved = true
      game.board[7][7] = nil
      # Black castle Kingside
    elsif move == [4, 0, 2, 0] && game.board[2][0].instance_of?(King)
      game.board[3][0] = game.board[0][0]
      game.board[3][0].has_moved = true
      game.board[0][0] = nil
    # White castle Queenside
    elsif move == [4, 0, 6, 0] && game.board[6][0].instance_of?(King)
      game.board[5][0] = game.board[7][0]
      game.board[5][0].has_moved = true
      game.board[7][0] = nil
      # White castle Kingside
    end
  end

  include Check
  include Move
end
