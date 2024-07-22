# Contains the methods allowing Players to move Pieces.

module Move
  def get_move(game)
    puts "Player #{name}, please enter your move, or enter 'help' for more information."
    move = gets.chomp.downcase
    case move
    when "help"
      game.show_instructions
    when "save"
      game.save_game
    when "load"
      load_game
    else
      move
    end
  end

  def filter_move_string(move)
    # This method removes all non a-h or 1-7 characters, shifts those characters to string coordinates.
    # It then turns the string coordinates into an array of integers.
    move.tr("^a-h1-8", "").tr("1-8", "0-7").tr("a-h", "0-7").each_char.map(&:to_i)
  end

  def piece_valid(game, move)
    if game.board[move[0]][move[1]].nil? ||
       game.board[move[0]][move[1]].color != color
      false
    else
      true
    end
  end

  def make_move(game, move)
    # move_array in the format [start_column, start_row, end_column, end_row]
    chosen_piece = game.board[move[0]][move[1]]
    move_square = [move[2], move[3]]
    chosen_piece.position = move_square
    chosen_piece.has_moved = true

    game.board[move[2]][move[3]] = chosen_piece
    game.board[move[0]][move[1]] = nil
  end
end
