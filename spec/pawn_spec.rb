# Tests behaviour of Pawns.
require "./lib/main/piece/pawn"

describe Pawn do
  describe "#initialize" do
    context "new pieces have been created" do
      white_pawn = Pawn.new("white", [3, 1])
      black_pawn = Pawn.new("black", [3, 6])
      it "should have a position" do
        expect(white_pawn.position).to eq([3, 1])
        expect(black_pawn.position).to eq([3, 6])
      end
      it "should have a color" do
        expect(white_pawn.color).to eq("white")
        expect(black_pawn.color).to eq("black")
      end
      it "should have a display" do
        expect(white_pawn.display).to eq("\e[38;2;255;255;255m♙\e[0m")
        expect(black_pawn.display).to eq("\e[38;2;255;0;0m♙\e[0m")
      end
      it "should not have a move matrix" do
        expect(white_pawn.matrix).to eq([])
        expect(black_pawn.matrix).to eq([])
      end
    end
  end
  describe "#possible_moves" do
    game = Game.new
    test_piece = Pawn.new("white", [3, 1])
    game.board[3][1] = test_piece
    it "should calculate possible moves" do
      expect(test_piece.possible_moves(game)).to eq([[3, 2], [3, 3]])
    end
    it "should calculate reduced possible moves after first move" do
      test_piece.has_moved = true
      expect(test_piece.possible_moves(game)).to eq([[3, 2]])
    end
    it "should calculate additional possible moves for enemy occupied diagonals" do
      game.board[4][2] = Pawn.new("black", [4, 2])
      game.board[2][2] = Pawn.new("black", [2, 2])
      expect(test_piece.possible_moves(game)).to eq([[3, 2], [2, 2], [4, 2]])
    end
    it "should not calculate additional possible moves for ally occupied diagonals" do
      game.board[4][2] = Pawn.new("white", [4, 2])
      game.board[2][2] = Pawn.new("white", [2, 2])
      expect(test_piece.possible_moves(game)).to eq([[3, 2]])
    end
    it "should not show any possible moves if blocked" do
      game.board[3][2] = Pawn.new("black", [3, 2])
      expect(test_piece.possible_moves(game)).to eq([])
    end
  end
end
