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
# Castling
# En passant
# Promotion
# Check game endings on loaded games
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
# game.board[6][0] = King.new("white", [6, 0])
# game.board[4][7] = King.new("black", [4, 7])
# game.board[5][0] = Rook.new("white", [5, 0])
# game.board[5][1] = Pawn.new("white", [5, 1])
# game.board[6][1] = Pawn.new("white", [6, 1])
# game.board[7][0] = Queen.new("black", [7, 0])
# game.board[7][4] = Rook.new("black", [7, 4])

# game.show_board

# p white_player.check_mate(game)

# test this game

# <Game:0x00007eff0965ad38 @board=[[#<Rook:0x00007eff0965a8d8 @position=[0, 0], @color="white", @display="\e[38;2;255;255;255m♜\e[0m", @matrix=[[0, 1], [1, 0], [0, -1], [-1, 0]], @has_moved=false>, #<Pawn:0x00007eff0965a2e8 @position=[0, 1], @color="white", @display="\e[38;2;255;255;255m♙\e[0m", @matrix=[[0, 1], [0, 2]], @has_moved=false>, nil, nil, nil, #<Knight:0x00007eff0965a108 @position=[0, 5], @color="black", @display="\e[38;2;255;0;0m♞\e[0m", @matrix=[[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]], @has_moved=true>, #<Pawn:0x00007eff09659f28 @position=[0, 6], @color="black", @display="\e[38;2;255;0;0m♙\e[0m", @matrix=[], @has_moved=false>, #<Rook:0x00007eff09659ca8 @position=[0, 7], @color="black", @display="\e[38;2;255;0;0m♜\e[0m", @matrix=[[0, 1], [1, 0], [0, -1], [-1, 0]], @has_moved=false>], [nil, #<Pawn:0x00007eff09659a28 @position=[1, 1], @color="white", @display="\e[38;2;255;255;255m♙\e[0m", @matrix=[[0, 1], [0, 2]], @has_moved=false>, nil, nil, #<Knight:0x00007eff09659258 @position=[1, 4], @color="white", @display="\e[38;2;255;255;255m♞\e[0m", @matrix=[[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]], @has_moved=true>, nil, nil, nil], [#<Bishop:0x00007eff09658f38 @position=[2, 0], @color="white", @display="\e[38;2;255;255;255m♝\e[0m", @matrix=[[1, 1], [1, -1], [-1, -1], [-1, 1]], @has_moved=false>, #<Pawn:0x00007eff09658d58 @position=[2, 1], @color="white", @display="\e[38;2;255;255;255m♙\e[0m", @matrix=[[0, 1], [0, 2]], @has_moved=false>, nil, nil, nil, nil, #<Pawn:0x00007eff09658b78 @position=[2, 6], @color="black", @display="\e[38;2;255;0;0m♙\e[0m", @matrix=[[0, -1], [0, -2]], @has_moved=false>, #<Bishop:0x00007eff09658998 @position=[2, 7], @color="black", @display="\e[38;2;255;0;0m♝\e[0m", @matrix=[[1, 1], [1, -1], [-1, -1], [-1, 1]], @has_moved=false>], [#<Queen:0x00007eff09658768 @position=[3, 0], @color="white", @display="\e[38;2;255;255;255m♛\e[0m", @matrix=[[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]], @has_moved=false>, #<Pawn:0x00007eff096584e8 @position=[3, 1], @color="white", @display="\e[38;2;255;255;255m♙\e[0m", @matrix=[[0, 1], [0, 2]], @has_moved=false>, nil, nil, nil, nil, #<Pawn:0x00007eff096580d8 @position=[3, 6], @color="black", @display="\e[38;2;255;0;0m♙\e[0m", @matrix=[[0, -1], [0, -2]], @has_moved=false>, #<Queen:0x00007eff09657c28 @position=[3, 7], @color="black", @display="\e[38;2;255;0;0m♛\e[0m", @matrix=[[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]], @has_moved=false>], [#<King:0x00007eff09657958 @position=[4, 0], @color="white", @display="\e[38;2;255;255;255m♚\e[0m", @matrix=[[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]], @has_moved=false>, nil, #<Pawn:0x00007eff09657728 @position=[4, 2], @color="white", @display="\e[38;2;255;255;255m♙\e[0m", @matrix=[[0, 1]], @has_moved=true>, nil, nil, nil, #<Pawn:0x00007eff096573b8 @position=[4, 6], @color="black", @display="\e[38;2;255;0;0m♙\e[0m", @matrix=[[0, -1], [0, -2]], @has_moved=false>, #<King:0x00007eff09657188 @position=[4, 7], @color="black", @display="\e[38;2;255;0;0m♚\e[0m", @matrix=[[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]], @has_moved=false>], [nil, #<Pawn:0x00007eff09656dc8 @position=[5, 1], @color="white", @display="\e[38;2;255;255;255m♙\e[0m", @matrix=[[0, 1], [0, 2]], @has_moved=false>, nil, nil, nil, #<Pawn:0x00007eff09656b48 @position=[5, 5], @color="black", @display="\e[38;2;255;0;0m♙\e[0m", @matrix=[[0, -1]], @has_moved=true>, nil, #<Bishop:0x00007eff09656878 @position=[5, 7], @color="black", @display="\e[38;2;255;0;0m♝\e[0m", @matrix=[[1, 1], [1, -1], [-1, -1], [-1, 1]], @has_moved=false>], [#<Knight:0x00007eff096565a8 @position=[6, 0], @color="white", @display="\e[38;2;255;255;255m♞\e[0m", @matrix=[[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]], @has_moved=false>, #<Pawn:0x00007eff09656288 @position=[6, 1], @color="white", @display="\e[38;2;255;255;255m♙\e[0m", @matrix=[[0, 1], [0, 2]], @has_moved=false>, nil, nil, #<Pawn:0x00007eff09655ec8 @position=[6, 4], @color="black", @display="\e[38;2;255;0;0m♙\e[0m", @matrix=[[0, -1]], @has_moved=true>, nil, nil, #<Knight:0x00007eff096559c8 @position=[6, 7], @color="black", @display="\e[38;2;255;0;0m♞\e[0m", @matrix=[[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]], @has_moved=false>], [#<Rook:0x00007eff09655748 @position=[7, 0], @color="white", @display="\e[38;2;255;255;255m♜\e[0m", @matrix=[[0, 1], [1, 0], [0, -1], [-1, 0]], @has_moved=false>, #<Pawn:0x00007eff09655428 @position=[7, 1], @color="white", @display="\e[38;2;255;255;255m♙\e[0m", @matrix=[[0, 1], [0, 2]], @has_moved=false>, nil, nil, #<Bishop:0x00007eff09655108 @position=[7, 4], @color="white", @display="\e[38;2;255;255;255m♝\e[0m", @matrix=[[1, 1], [1, -1], [-1, -1], [-1, 1]], @has_moved=true>, nil, #<Pawn:0x00007eff09654e88 @position=[7, 6], @color="black", @display="\e[38;2;255;0;0m♙\e[0m", @matrix=[[0, -1]], @has_moved=false>, #<Rook:0x00007eff09654c08 @position=[7, 7], @color="black", @display="\e[38;2;255;0;0m♜\e[0m", @matrix=[[0, 1], [1, 0], [0, -1], [-1, 0]], @has_moved=false>]], @current_player=#<Player:0x00007eff095189e8 @color="black", @name="Black", @currently_in_check=false>, @next_player=#<Player:0x00007eff09518808 @color="white", @name="White", @currently_in_check=false>, @game_over=false>
