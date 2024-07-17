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
      it "should have a move matrix" do
        expect(white_pawn.matrix).to eq([[0, 1], [0, 2], [1, 1], [-1, 1]])
        expect(black_pawn.matrix).to eq([[0, -1], [0, -2], [1, -1], [-1, -1]])
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
    it "should calculate additional possible moves for occupied diagonals" do
      game.board[4][2] = Pawn.new("white", [4, 2])
      game.board[2][2] = Pawn.new("black", [2, 2])
      expect(test_piece.possible_moves(game)).to eq([[3, 2], [4, 2], [2, 2]])
    end
    # Still need check-checker.
  end
end
