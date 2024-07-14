# Tests behaviour of King.
require "./lib/main/piece/king"

describe King do
  describe "#initialize" do
    context "a new piece has been created" do
      white_king = King.new("white", [3, 0])
      it "should have a position" do
        expect(white_king.position).to eq([3, 0])
      end
      it "should have a color" do
        expect(white_king.color).to eq("white")
      end
      it "should have a display" do
        expect(white_king.display).to eq("\e[38;2;255;255;255m♔\e[0m")
      end
      it "should have a move matrix" do
        expect(white_king.matrix).to eq([[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]])
      end
      it "should calculate possible moves" do
        expect(white_king.possible_moves).to eq([[3, 1], [4, 1], [4, 0], [2, 0], [2, 1]])
      end
    end
  end
end
