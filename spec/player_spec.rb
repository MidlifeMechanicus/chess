# Tests behaviour of Player.
require "./lib/main/player"

describe Player do
  describe "#initialize" do
    context "a new player has been created" do
      white_player = Player.new("white")
      it "should have a color" do
        expect(white_player.color).to eq("white")
      end
    end
  end
end
