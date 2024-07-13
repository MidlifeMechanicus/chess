# Displays Chess gameboard.
require_relative "board/show_board"

class Board
  attr_accessor :board

  def initialize
    #
    @board = Array.new(8) { Array.new(8) }
  end

  def set_board
    board[3][0] = King.new("white", [3, 0])
    board[4][7] = King.new("black", [4, 7])
  end

  include ShowBoard
end
