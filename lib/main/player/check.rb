# Checks to see if Player is in check.

module Check
  def check_check(game, king_position = find_king(game))
    check = false
    game.board.each do |column|
      column.each do |square|
        next if square.nil?
        next if square.color == color

        if square.possible_moves(game).include?(king_position)
          check = true
          break
        end
      end
    end
    check
  end

  def find_king(game)
    king_position = []
    game.board.each do |column|
      column.each do |square|
        king_position = square.position if square.class == King && square.color == color
      end
    end
    king_position
  end
end
