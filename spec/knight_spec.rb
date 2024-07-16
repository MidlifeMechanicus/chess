# Tests behaviour of Knight.
require "./lib/main/piece/knight"

describe Knight do
  describe "#initialize" do
    context "a new piece has been created" do
      knight = Knight.new("white", [1, 0])
      it "should have a position" do
        expect(knight.position).to eq([1, 0])
      end
      it "should have a color" do
        expect(knight.color).to eq("white")
      end
      it "should have a display" do
        expect(knight.display).to eq("\e[38;2;255;255;255m♞\e[0m")
      end
      it "should have a move matrix" do
        expect(knight.matrix).to eq([[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [1, -2]])
      end
      it "should calculate possible moves" do
        expect(knight.possible_moves).to eq([[2, 2], [3, 1]])
      end
    end
  end
end
