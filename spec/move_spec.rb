# Tests behaviour of Move module.
require "./lib/main"

describe Player do
  describe "#get_move" do
    it "should call #show_instructions on getting 'help'" do
      player = Player.new("black")
      allow(player).to receive(:gets).and_return("help")
      expect(player).to receive(:show_instructions)
      player.get_move
    end
    xit "should call #check_move otherwise" do
      player = Player.new("black")
      allow(player).to receive(:gets).and_return("test")
      expect(player).to receive(:check_move)
      player.get_move
      # Since refactor, should return move.
    end
  end
end
