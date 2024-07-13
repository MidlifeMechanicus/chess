# Creates a king piece.
require_relative "../piece"

class King < Piece
  def initialize(coordinates, color)
    @position = coordinates
    @color = color
    @display = set_display
  end

  def set_display
    color == "black" ? "♚" : "♔"
  end
end
