require_relative "main/game"
require_relative "main/player"
require_relative "main/piece"
require_relative "main/piece/king"
require_relative "main/piece/queen"
require_relative "main/piece/bishop"
require_relative "main/piece/knight"
require_relative "main/piece/rook"
require_relative "main/piece/pawn"

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

# p game.board[2][7].matrix
# p game.board[2][7].possible_moves
# # puts player_white.get_move
