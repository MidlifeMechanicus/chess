# Tests behaviour of King
require "./lib/main/piece/king"

describe King do
  describe "#initialize" do
    context "a new piece has been created" do
      white_king = King.new([3, 0], "white")
      it "should have a position" do
        expect(white_king.position).to eq([3, 0])
      end
      it "should have a color" do
        expect(white_king.color).to eq("white")
      end
      it "should have a display" do
        expect(white_king.display).to eq("♔")
      end
    end
  end
end
