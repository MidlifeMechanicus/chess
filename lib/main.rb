# require "matrix"
# # This allows vector addition.
require_relative "main/game"
require_relative "main/player"
require_relative "main/piece"
require_relative "main/piece/king"
require_relative "main/piece/queen"
require_relative "main/piece/bishop"
require_relative "main/piece/knight"
require_relative "main/piece/rook"
require_relative "main/piece/pawn"

# game = Game.new
# game.set_board
# game.show_board
#
piece = Piece.new("black", [1, 1])
# piece.matrix = [[0, 1], [0, -1]]
# piece.position = [4, 4]
# p piece.possible_moves(1)
# game.board[4][4] = Rook.new("black", [4, 4])
# game.show_board

# test_rook = game.board[4][4]
# p test_rook.possible_moves

# position = Vector[4, 4]
# matrix = [Vector[0, 1], Vector[1, 0], Vector[0, -1], Vector[-1, 0]]

# puts position * 2

# moves = position.map do |p|
#   maxtrix.map do |m|
#     ?
#   end
# end
#
# position = [4, 4]

# def get_rook_matrix
#   base_matrix = [[0, 1], [1, 0], [0, -1], [-1, 0]]
#   range = [1, 2, 3, 4, 5, 6, 7]
#   matrix = range.map do |r|
#     base_matrix.map { |m| [m[0] * r, m[1] * r] }
#   end
#   matrix.flatten(1)
# end

# p get_rook_matrix

# def alt_get_rook_matrix
#   position = [4, 4]
#   base_matrix = [[0, 1], [1, 0], [0, -1], [-1, 0]]
#   range = [1, 2]
#   matrix = base_matrix.map do |m|
#     range.map do |r|
#       [m[0] * r, m[1] * r]
#       break if [m[0] * r, m[1] * r] == [0, 1]
#     end
#   end
#   matrix.flatten(1)
# end
# position = Vector[4, 4]

# def rec_rook(vec, current = [4, 4])
#   # return current if current == [6, 6]

#   current = [current[0] + vec[0], current[1] + vec[1]]
#   return [current] if current == [7, 7]

#   [current] + rec_rook(vec, current)
# end

# p rec_rook(Vector[1, 1])
