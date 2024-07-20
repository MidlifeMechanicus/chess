require_relative "main/game"
require_relative "main/player"
require_relative "main/piece"
require_relative "main/piece/king"
require_relative "main/piece/queen"
require_relative "main/piece/bishop"
require_relative "main/piece/knight"
require_relative "main/piece/rook"
require_relative "main/piece/pawn"

# Still to be implemented:
# Castling
# En passant
# Check-mate
# Stalemate
# Promotion
# Save
# Load
# Resign

# GENERAL TESTING

# game = Game.new
# game.set_board
# black_player = Player.new("black")
# black_player.move_piece(game)

# TESTING CHECK

game = Game.new
black_player = Player.new("black")
white_player = Player.new("white")
game.board[6][0] = King.new("white", [6, 0])
game.board[7][0] = Queen.new("black", [7, 0])
game.show_board
p white_player.check_check(game)

game.show_board

p white_player.check_mate(game)

# game.show_board

# game.board[6][1] = Queen.new("black", [6, 1])
# game.show_board
# p white_player.check_mate(game)
