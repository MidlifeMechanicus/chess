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

  describe "#get_move" do
    it "should call #show_instructions on getting 'help'" do
      player = Player.new("black")
      allow(player).to receive(:gets).and_return("help")
      expect(player).to receive(:show_instructions)
      player.get_move
    end
    it "should call #check_move" do
      player = Player.new("black")
      allow(player).to receive(:gets).and_return("test")
      expect(player).to receive(:check_move)
      player.get_move
    end
  end

  describe "#make_move" do
    context "a new game has been created" do
      game = Game.new
      game.set_board
      player_white = Player.new("white")
      xit "should move White King from D1 to D2" do
        white_king = game.board[3][0]
        player_white.make_move(game, [3, 0, 3, 1])
        expect(game.board[3][1]).to eq(white_king)
        expect(game.board[3][0]).to be nil
      end
    end
  end
end
