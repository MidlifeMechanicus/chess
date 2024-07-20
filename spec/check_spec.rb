# Tests behaviour of Check module.
require "./lib/main/player"

describe Player do
  describe "#find_king" do
    context "a new board with two players" do
      game = Game.new
      game.set_board
      white_player = Player.new("white")
      black_player = Player.new("black")
      it "should find the white king" do
        expect(white_player.find_king(game)).to eq([4, 0])
      end
      it "should find the black king" do
        expect(black_player.find_king(game)).to eq([4, 7])
      end
    end
  end

  describe "#check_check" do
    context "two players and an empty board" do
      game = Game.new
      white_player = Player.new("white")
      black_player = Player.new("black")
      game.board[4][0] = King.new("white", [4, 0])
      game.board[4][7] = King.new("black", [4, 7])
      it "should find neither king in check" do
        expect(white_player.check_check(game)).to be false
        expect(black_player.check_check(game)).to be false
      end
      it "should find only the white king in check" do
        game.board[4][4] = Rook.new("black", [4, 4])
        expect(white_player.check_check(game)).to be true
        expect(black_player.check_check(game)).to be false
      end
    end
  end
end
