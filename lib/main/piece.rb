require "./lib/main/game"

# Creates chess pieces.
class Piece
  attr_accessor :position, :color, :display, :matrix, :has_moved

  def initialize(color, coordinates)
    @position = coordinates
    @color = color
    @display = set_display
    @matrix = [[1, 0], [-1, 0]]
    @has_moved = false
  end

  def set_display
    color == "black" ? "X" : "O"
  end

  def possible_moves(game)
    # This function works for Rooks, Bishops and Queens. Other pieces need a simplified method.
    moves = matrix.map do |m|
      move_vector(game, m)
    end
    moves.flatten!(1).keep_if do |m|
      m if m[0].between?(0, 7) && m[1].between?(0, 7)
    end
  end

  def move_vector(game, vector, square = position)
    square = [square[0] + vector[0], square[1] + vector[1]]
    return [square] if !square[0].between?(0, 7) ||
                       !square[1].between?(0, 7) ||
                       !game.board[square[0]][square[1]].nil?

    [square] + move_vector(game, vector, square)
  end

  def check_ally_occupied(game, location)
    !(game.board[location[0]][location[1]].nil? ||
       (game.board[location[0]][location[1]].color != color))
  end

  def check_move_valid(game, move)
    if possible_moves(game).include?(move) &&
       !check_ally_occupied(game, move)
      true
    else
      false
    end
  end
end
