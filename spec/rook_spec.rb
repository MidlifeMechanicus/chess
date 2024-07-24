# Tests behaviour of Rook.
require "./lib/main/piece/rook"

describe Rook do
  describe "#initialize" do
    context "a new piece has been created" do
      white_rook = Rook.new("white", [0, 7])
      black_rook = Rook.new("black", [7, 7])
      it "should have a position" do
        expect(white_rook.position).to eq([0, 7])
        expect(black_rook.position).to eq([7, 7])
      end
      it "should have a color" do
        expect(white_rook.color).to eq("white")
        expect(black_rook.color).to eq("black")
      end
      it "should have a display" do
        expect(white_rook.display).to eq("\e[38;2;255;255;255m♜\e[0m")
        expect(black_rook.display).to eq("\e[38;2;255;0;0m♜\e[0m")
      end
      it "should have a move matrix" do
        expect(white_rook.matrix).to eq([[0, 1], [1, 0], [0, -1], [-1, 0]])
        expect(black_rook.matrix).to eq([[0, 1], [1, 0], [0, -1], [-1, 0]])
      end
    end
  end
  describe "#possible_moves" do
    game = Game.new
    test_piece = Rook.new("white", [0, 0])
    game.board[0][0] = test_piece
    it "should calculate possible moves" do
      expect(test_piece.possible_moves(game)).to eq([[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0],
                                                     [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]])
    end
  end
end
