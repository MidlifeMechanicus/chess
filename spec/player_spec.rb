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
    end
  end

  describe "#show_instructions" do
    # This is where instructions and save/load commands will be held.
  end
  # move_piece probably untestable - not unit testing
  # check promotion
  # check enpassant
  # clear en_passant
  # check castle
end
