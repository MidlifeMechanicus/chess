require_relative "main/game"
require_relative "main/player"
require_relative "main/piece"
require_relative "main/piece/king"
require_relative "main/piece/queen"
require_relative "main/piece/bishop"
require_relative "main/piece/knight"
require_relative "main/piece/rook"
require_relative "main/piece/pawn"
require "yaml"

def load_game
  if File.exist?("saved_game.yml")
    game = YAML.safe_load_file(
      "saved_game.yml",
      permitted_classes: [Game,
                          King,
                          Queen,
                          Bishop,
                          Knight,
                          Rook,
                          Pawn,
                          Player,
                          Symbol]
    )
    if game.current_player.color == "black"
      black_player = game.current_player
      white_player = game.next_player
    else
      black_player = game.next_player
      white_player = game.current_player
    end
  else
    puts "You do not have a saved game."
  end
  game.current_player.move_piece(game)
end

# Still to be implemented:
# Review, refactor, rspec all

# GENERAL TESTING

# game = Game.new
# game.set_board
# white_player = Player.new("white")
# black_player = Player.new("black")
# game.current_player = white_player
# game.next_player = black_player

# game.play_game

# SAVE TESTING

# game = YAML.safe_load_file(
#   "saved_game.yml",
#   permitted_classes: [Game,
#                       King,
#                       Queen,
#                       Bishop,
#                       Knight,
#                       Rook,
#                       Pawn,
#                       Player,
#                       Symbol]
# )

# p game

# DEBUGGING
game = Game.new
game.board[3][0] = King.new("white", [3, 0])
game.board[3][7] = King.new("black", [3, 7])
white_king = game.board[3][0]
black_king = game.board[3][7]
game.board[0][7] = Piece.new("black", [0, 7])
game.board[7][7] = Piece.new("black", [7, 7])
game.current_player = Player.new("black")

p !game.board[0][7].nil?
p game.board[0][7].has_moved == false
p game.board[1][7].nil?
p game.board[2][7].nil?
p game.board[3][7].nil?
p game.current_player.check_check(game, [2, 7]) == false
p game.current_player.check_check(game, [3, 7]) == false

# p black_king.matrix

# black_king.set_matrix(game)

# p black_king.matrix
