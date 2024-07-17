require_relative "main/game"
require_relative "main/player"
require_relative "main/piece"
require_relative "main/piece/king"
require_relative "main/piece/queen"
require_relative "main/piece/bishop"
require_relative "main/piece/knight"
require_relative "main/piece/rook"
require_relative "main/piece/pawn"

game = Game.new
# game.set_board
# game.show_board
piece = Pawn.new("white", [3, 1])
p piece.possible_moves(game)
p game.board[4][2]
p game.board[2][2]
