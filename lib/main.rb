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
# En passant
# Review, refactor, rspec all

# GENERAL TESTING

game = Game.new
game.set_board
white_player = Player.new("white")
black_player = Player.new("black")
game.current_player = white_player
game.next_player = black_player

game.play_game

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

# game = Game.new
# white_player = Player.new("white")
# black_player = Player.new("black")
# game.current_player = white_player
# game.next_player = black_player
# game.board[4][0] = King.new("white", [4, 0])
# game.board[4][7] = King.new("black", [4, 7])
# game.board[0][0] = Rook.new("white", [0, 0])
# game.board[7][7] = Rook.new("black", [7, 7])
# game.play_game

# game.board[6][1] = Pawn.new("white", [6, 1])
# game.board[7][0] = Queen.new("black", [7, 0])
# game.board[7][4] = Rook.new("black", [7, 4])

# game.show_board
