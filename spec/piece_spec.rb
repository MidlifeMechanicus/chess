# Tests behaviour of Piece
require "./lib/main/piece"

describe Piece do
  describe "#initialize" do
    context "a new piece has been created" do
      piece = Piece.new([1, 1])
      it "should have a position" do
        expect(piece.position).to eq([1, 1])
      end
      it "should have a display" do
        expect(piece.display).to eq("X")
      end
    end
  end
end
