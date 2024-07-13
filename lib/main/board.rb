# Displays Chess gameboard.
require_relative "board/show_board"

class Board
  attr_accessor :board

  def initialize
    #
    @board = Array.new(8) { Array.new(8) }
  end

  include ShowBoard
end
