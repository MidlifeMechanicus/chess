# Creates chess pieces.

class Piece
  attr_accessor :position, :display

  def initialize(coordinates)
    @position = coordinates
    @display = "X"
  end
end
