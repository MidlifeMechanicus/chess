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
game.set_board
# game.show_board

# white_player = Player.new("white")

# p game.board[3][0].class
# p white_player.find_king(game)

player = Player.new("black")

player.move_piece(game)
