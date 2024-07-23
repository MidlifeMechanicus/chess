# Checks to see if Player is in check.

module Check
  def check_check(game, king_position = find_king(game))
    check = false
    game.board.each do |column|
      column.each do |square|
        next if square.nil?
        next if square.color == color

        next unless square.possible_moves(game).include?(king_position)

        check = true
        break
      end
    end
    check
  end

  def find_king(game)
    king_position = []
    game.board.each do |column|
      column.each do |square|
        king_position = square.position if square.instance_of?(King) && square.color == color
      end
    end
    king_position
  end

  def check_mate(game)
    # In order to find checkmate, we need to check every possible move the player could make before reporting back.
    checkmate = true
    game.board.each.with_index do |column, i|
      column.each.with_index do |square, j|
        next unless piece_valid(game, [i, j]) == true

        square.possible_moves(game).each do |move|
          next unless square.check_ally_occupied(game, move) == false

          working_copy = Marshal.load(Marshal.dump(game))
          # It is well accepted that Ruby is a pass-by-value, high level programming language.
          # Unfortunately, this is slightly incorrect,
          # Ruby does pass-by-value, however, most values in ruby are references.
          # When Ruby does an assignment of a simple datatypes, integers, floats, strings, it will create a new object.
          # However, when assigning objects such as arrays and hashes, you are creating references.
          #
          # This means that when we 'copy' our game, we are just creating a new set of references.
          # Changes the 'copy' flow back to the original, perhanently changing it!
          # This is similar to the mastermind project where we had to use #dup to create a 'safe' working copy.
          # That does not work with more complex objects, however. We must instead serialise and load the object as done above.
          make_move(working_copy, [i, j, move[0], move[1]])
          next unless check_check(working_copy) == false

          checkmate = false
          break
        end
      end
    end
    checkmate
  end
end
