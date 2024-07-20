# Tests behaviour of Player.
require "./lib/main"

describe Player do
  describe "#initialize" do
    context "a new player has been created" do
      white_player = Player.new("white")
      it "should have a color" do
        expect(white_player.color).to eq("white")
      end
      it "should have a name" do
        expect(white_player.name).to eq("White")
      end
      it "should not be in check" do
        expect(white_player.currently_in_check).to be false
      end
    end
  end

  describe "#show_instructions" do
    # This is where instructions and save/load commands will be held.
  end
end
