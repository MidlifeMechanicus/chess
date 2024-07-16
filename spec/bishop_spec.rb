# Tests behaviour of Bishop.
require "./lib/main/piece/bishop"

describe Bishop do
  describe "#initialize" do
    context "a new piece has been created" do
      bishop = Bishop.new("black", [2, 7])
      it "should have a position" do
        expect(bishop.position).to eq([2, 7])
      end
      it "should have a color" do
        expect(bishop.color).to eq("black")
      end
      it "should have a display" do
        expect(bishop.display).to eq("\e[38;2;255;0;0m♝\e[0m")
      end
      it "should have a move matrix" do
        expect(bishop.matrix).to eq([[1, 1], [1, -1], [-1, -1], [-1, 1]])
      end
    end
  end
  describe "#possible_moves" do
    game = Game.new
    test_piece = Bishop.new("white", [2, 0])
    game.board[2][0] = test_piece
    it "should calculate possible moves" do
      expect(test_piece.possible_moves(game)).to eq([[3, 1], [4, 2], [5, 3], [6, 4], [7, 5], [1, 1], [0, 2]])
    end
  end
end
