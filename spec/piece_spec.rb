# Tests behaviour of Piece.
require "./lib/main/piece"

describe Piece do
  describe "#initialize" do
    context "a new piece has been created" do
      piece = Piece.new
      it "should have a position" do
        expect(piece.position).to eq([])
      end
      it "should have a color" do
        expect(piece.color).to be nil
      end
      it "should have a display" do
        expect(piece.display).to eq("X")
      end
    end
  end
end
