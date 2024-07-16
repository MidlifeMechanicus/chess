# Tests behaviour of Piece.
require "./lib/main/piece"
require "./lib/main"

describe Piece do
  describe "#initialize" do
    context "a new piece has been created" do
      piece = Piece.new
      it "should have a position" do
        expect(piece.position).to eq([])
      end
      it "should have a color" do
        expect(piece.color).to eq("")
      end
      it "should have a display" do
        expect(piece.display).to eq("X")
      end
      it "should have a matrix" do
        expect(piece.matrix).to eq([])
      end
    end
  end

  describe "#check_ally_occupied" do
    context "a new game board has been created" do
      game = Game.new
      game.board[1][1] = Piece.new
      game.board[1][1].color = "black"
      game.board[2][2] = Piece.new
      game.board[2][2].color = "white"
      test_piece = Piece.new
      test_piece.color = "black"
      it "should recognize an ally-occupied square" do
        expect(test_piece.check_ally_occupied(game, [1, 1])).to be true
      end
      it "should recognize an empty square is not ally-occupied" do
        expect(test_piece.check_ally_occupied(game, [2, 1])).to be false
      end
      it "should recognize an enemy-occupied square is not ally-occupied" do
        expect(test_piece.check_ally_occupied(game, [2, 2])).to be false
      end
    end
  end
end

# ♕♖♗♘♙
