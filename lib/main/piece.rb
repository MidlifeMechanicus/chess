# Creates chess pieces.

class Piece
  attr_accessor :position, :color, :display, :matrix

  def initialize
    @position = []
    @color = ""
    @display = "X"
    @matrix = []
  end

  def possible_moves
    matrix.map do |m|
      [@position[0] + m[0], @position[1] + m[1]]
    end
  end
end

# TRANSFORMATIONS = [[1, 2], [-2, -1], [-1, 2], [2, -1],
#                      [1, -2], [-2, 1], [-1, -2], [2, 1]].freeze

# TRANSFORMATIONS.map { |t| [@position[0] + t[0], @position[1] + t[1]] }
#                    .keep_if { |e| MoveNode.valid?(e) }
#                    .reject { |e| @@history.include?(e) }
#                    .map { |e| MoveNode.new(e, self) }
