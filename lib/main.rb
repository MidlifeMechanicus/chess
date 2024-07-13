require_relative "main/board"

# We will need a game_board that has pieces as attributes so it can track them.
# We will need a peiece class, and subclasses.
# Will have to think about how to save, but that can probably happen at the end.
# Not TDD, but def use rspec where possible.
# While it is a terminal game, I still need a board display.
# Consider chess notation
# have to select piece at a given node, then check that the move is valid
# movement rules stored in pieces
# Do we need separate players with own pieces for organisation?

board = Board.new
p board
board.show_board
