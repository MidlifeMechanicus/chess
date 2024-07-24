# Tests behaviour of King.
require "./lib/main/piece/king"
require "./lib/main/player"

describe King do
  describe "#initialize" do
    context "a new piece has been created" do
      white_king = King.new("white", [4, 0])
      black_king = King.new("black", [4, 7])
      it "should have a position" do
        expect(white_king.position).to eq([4, 0])
        expect(black_king.position).to eq([4, 7])
      end
      it "should have a color" do
        expect(white_king.color).to eq("white")
        expect(black_king.color).to eq("black")
      end
      it "should have a display" do
        expect(white_king.display).to eq("\e[38;2;255;255;255m♚\e[0m")
        expect(black_king.display).to eq("\e[38;2;255;0;0m♚\e[0m")
      end
      it "should have an empty move matrix" do
        expect(white_king.matrix).to eq([])
        expect(black_king.matrix).to eq([])
      end
    end
  end
  describe "#set_matrix" do
    context "a new game has been created" do
      game = Game.new
      game.board[4][0] = King.new("white", [4, 0])
      game.board[4][7] = King.new("black", [4, 7])
      white_king = game.board[4][0]
      black_king = game.board[4][7]
      game.board[0][7] = Piece.new("black", [0, 7])
      game.board[7][7] = Piece.new("black", [7, 7])
      it "should create a basic move matrix for the white king" do
        game.current_player = Player.new("white")
        white_king.set_matrix(game)
        expect(white_king.matrix).to eq([[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]])
      end
      it "should create an expanded move matrix for the black king" do
        # Strictly, this fuction does not require a Rook to detect a valid castle; only a piece of the same color, in the correct location, that has not moved.
        # In a real game, only a Rook can fulfil those conditions.
        game.current_player = Player.new("black")
        black_king.set_matrix(game)
        expect(black_king.matrix).to eq([[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1], [-2, 0],
                                         [2, 0]])
      end
      it "should create a basic move matrix for the black king if the corner pieces have moved" do
        game.board[0][7].has_moved = true
        game.board[7][7].has_moved = true
        game.current_player = Player.new("black")
        black_king.set_matrix(game)
        expect(black_king.matrix).to eq([[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]])
      end
      it "should create an expanded move matrix for the white king if corner pieces are added" do
        game.board[0][0] = Piece.new("white", [0, 0])
        game.board[7][0] = Piece.new("white", [7, 0])
        game.current_player = Player.new("white")
        white_king.set_matrix(game)
        expect(white_king.matrix).to eq([[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1], [-2, 0],
                                         [2, 0]])
      end
    end
  end
  describe "#possible_moves" do
    context "a new game is created" do
      game = Game.new
      game.current_player = Player.new("white")
      game.board[4][0] = King.new("white", [4, 0])
      white_king = game.board[4][0]
      it "should calculate possible moves, recognising board edges" do
        white_king.set_matrix(game)
        expect(white_king.possible_moves(game)).to eq([[4, 1], [5, 1], [5, 0], [3, 0], [3, 1]])
      end
      it "should calculate additonal moves when castling available." do
        game.board[0][0] = Piece.new("white", [0, 0])
        game.board[7][0] = Piece.new("white", [7, 0])
        white_king.set_matrix(game)
        expect(white_king.possible_moves(game)).to eq([[4, 1], [5, 1], [5, 0], [3, 0], [3, 1], [2, 0], [6, 0]])
      end
      it "should calculate possible moves when no board edges are nearby" do
        game.board[4][4] = King.new("black", [4, 4])
        black_king = game.board[4][4]
        game.current_player = Player.new("black")
        black_king.set_matrix(game)
        expect(black_king.possible_moves(game)).to eq([[4, 5], [5, 5], [5, 4], [5, 3], [4, 3], [3, 3], [3, 4], [3, 5]])
      end
    end
  end
end
