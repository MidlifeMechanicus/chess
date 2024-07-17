# Contains the methods allowing Players to move Pieces.

module Move
  def get_move
    puts "Player #{name}, please enter your move, or enter 'help' for more information."
    move = gets.chomp.downcase
    case move
    when "help"
      show_instructions
    else
      move
    end
  end

  def move_format(move)
    true if move.length == 4 &&
            move.each { |n| n.between?(0, 7) }
  end

  def piece_valid(game, move)
    if game.board[move[0]][move[1]].nil? ||
       game.board[move[0]][move[1]].color != color
      false
    else
      true
    end
  end
end
