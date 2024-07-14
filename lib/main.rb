require_relative "main/game"
require_relative "main/player"
require_relative "main/piece"
require_relative "main/piece/king"

# We will need a game_board that has pieces as attributes so it can track them.
# We will need a peiece class, and subclasses.
# Will have to think about how to save, but that can probably happen at the end.
# Not TDD, but def use rspec where possible.
# While it is a terminal game, I still need a board display.
# Consider chess notation
# have to select piece at a given node, then check that the move is valid
# movement rules stored in pieces
# Do we need separate players with own pieces for organisation?

# game = Game.new
# game.set_board
# game.show_board
# player_white = Player.new("white")
# player_white.make_move(game, [3, 0, 3, 1])
# game.show_board

matrix = [[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]]

# matrix = matrix.map { |m| [m[0] * 2, m[1] * 2] }
array = matrix + \
        matrix.map { |m| [m[0] * 2, m[1] * 2] } +
        matrix.map { |m| [m[0] * 3, m[1] * 3] }

p array

range = [1, 2, 3, 4, 5, 6, 7]
new_array = range.map do |i|
  matrix.map { |m| [m[0] * i, m[1] * i] }
end

p new_array.flatten(1)
