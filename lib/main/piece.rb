# Creates chess pieces.

class Piece
  attr_accessor :position, :color, :display

  def initialize
    @position = []
    @color = nil
    @display = "X"
  end
end
