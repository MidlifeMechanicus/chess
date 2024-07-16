# Tests behaviour of Rook.
require "./lib/main/piece/rook"

describe Rook do
  describe "#initialize" do
    context "a new piece has been created" do
      rook = Rook.new("black", [0, 7])
      it "should have a position" do
        expect(rook.position).to eq([0, 7])
      end
      it "should have a color" do
        expect(rook.color).to eq("black")
      end
      it "should have a display" do
        expect(rook.display).to eq("\e[38;2;255;0;0m♜\e[0m")
      end
      it "should have a move matrix" do
        expect(rook.matrix).to eq([[0, 1], [1, 0], [0, -1], [-1, 0]])
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
