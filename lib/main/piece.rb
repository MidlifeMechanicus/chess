# Creates chess pieces.
require "./lib/main/game"

class Piece
  attr_accessor :position, :color, :display, :matrix

  def initialize
    @position = []
    @color = ""
    @display = "X"
    @matrix = []
  end

  def possible_moves(game)
    moves = matrix.map do |m|
      move_vector(game, m)
    end
    moves.flatten!(1).keep_if do |m|
      m if m[0].between?(0, 7) && m[1].between?(0, 7)
    end
  end

  def move_vector(game, vector, square = position)
    square = [square[0] + vector[0], square[1] + vector[1]]
    return [square] if !square[0].between?(0, 7) || !square[1].between?(0, 7)

    # Need collision base case

    [square] + move_vector(game, vector, square)
  end

  # def possible_moves
  #   moves = matrix.map do |m|
  #     [@position[0] + m[0], @position[1] + m[1]]
  #   end
  #   moves.keep_if do |m|
  #     m if m[0].between?(0, 7) && m[1].between?(0, 7)
  #   end
  # end

  def check_ally_occupied(game, location)
    if game.board[location[0]][location[1]].nil? ||
       (game.board[location[0]][location[1]].color != color)
      false
    else
      true
    end
  end
  # need filter for pawn movements
end

# unify symbols

# TRANSFORMATIONS = [[1, 2], [-2, -1], [-1, 2], [2, -1],
#                      [1, -2], [-2, 1], [-1, -2], [2, 1]].freeze

# TRANSFORMATIONS.map { |t| [@position[0] + t[0], @position[1] + t[1]] }
#                    .keep_if { |e| MoveNode.valid?(e) }
#                    .reject { |e| @@history.include?(e) }
#                    .map { |e| MoveNode.new(e, self) }
