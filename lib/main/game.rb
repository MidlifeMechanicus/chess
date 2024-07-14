# Displays Chess gameboard.
require_relative "game/show_board"

class Game
  attr_accessor :board

  def initialize
    #
    @board = Array.new(8) { Array.new(8) }
  end

  def set_board
    board[3][0] = Queen.new("white", [3, 0])
    board[4][0] = King.new("white", [4, 0])
    board[0][1] = Pawn.new("white", [0, 1])
    board[1][1] = Pawn.new("white", [1, 1])
    board[2][1] = Pawn.new("white", [2, 1])
    board[3][1] = Pawn.new("white", [3, 1])
    board[4][1] = Pawn.new("white", [4, 1])
    board[5][1] = Pawn.new("white", [5, 1])
    board[6][1] = Pawn.new("white", [6, 1])
    board[7][1] = Pawn.new("white", [7, 1])
    board[0][6] = Pawn.new("black", [0, 6])
    board[1][6] = Pawn.new("black", [1, 6])
    board[2][6] = Pawn.new("black", [2, 6])
    board[3][6] = Pawn.new("black", [3, 6])
    board[4][6] = Pawn.new("black", [4, 6])
    board[5][6] = Pawn.new("black", [5, 6])
    board[6][6] = Pawn.new("black", [6, 6])
    board[7][6] = Pawn.new("black", [7, 6])
    board[3][7] = Queen.new("black", [3, 7])
    board[4][7] = King.new("black", [4, 7])
  end

  include ShowBoard
end

# The way that Method Access Control is implemented in Ruby is through the use of the public, private, and protected access modifiers. Right now, all the methods in our GoodDog class are public methods. A public method is a method that is available to anyone who knows either the class name or the object's name. These methods are readily available for the rest of the program to use and comprise the class's interface (that's how other classes and objects will interact with this class and its objects).

# Sometimes you'll have methods that are doing work in the class but don't need to be available to the rest of the program. These methods can be defined as private. How do we define private methods? We use the private method call in our program and anything below it is private (unless another method, like protected, is called after it to negate it).
#
# Public and private methods are most common, but in some less common situations, we'll want an in-between approach. For this, we can use the protected method to create protected methods. Protected methods are similar to private methods in that they cannot be invoked outside the class. The main difference between them is that protected methods allow access between class instances, while private methods do not.
