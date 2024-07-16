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
        expect(bishop.matrix).to eq([[1, 1], [1, -1], [-1, -1], [-1, 1], [2, 2], [2, -2], [-2, -2], [-2, 2], [3, 3],
                                     [3, -3], [-3, -3], [-3, 3], [4, 4], [4, -4], [-4, -4], [-4, 4], [5, 5], [5, -5], [-5, -5], [-5, 5], [6, 6], [6, -6], [-6, -6], [-6, 6], [7, 7], [7, -7], [-7, -7], [-7, 7]])
      end
      it "should calculate possible moves" do
        expect(bishop.possible_moves).to eq([[3, 6], [1, 6], [4, 5], [0, 5], [5, 4], [6, 3], [7, 2]])
      end
    end
  end
end
