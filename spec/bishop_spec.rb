# Tests behaviour of Bishop.
require "./lib/main/piece/bishop"

describe Bishop do
  describe "#initialize" do
    context "a new piece has been created" do
      white_bishop = Bishop.new("white", [2, 0])
      black_bishop = Bishop.new("black", [2, 7])
      it "should have a position" do
        expect(white_bishop.position).to eq([2, 0])
        expect(black_bishop.position).to eq([2, 7])
      end
      it "should have a color" do
        expect(white_bishop.color).to eq("white")
        expect(black_bishop.color).to eq("black")
      end
      it "should have a display" do
        expect(white_bishop.display).to eq("\e[38;2;255;255;255m♝\e[0m")
        expect(black_bishop.display).to eq("\e[38;2;255;0;0m♝\e[0m")
      end
      it "should have a move matrix" do
        expect(white_bishop.matrix).to eq([[1, 1], [1, -1], [-1, -1], [-1, 1]])
        expect(black_bishop.matrix).to eq([[1, 1], [1, -1], [-1, -1], [-1, 1]])
      end
    end
  end
  describe "#possible_moves" do
    game = Game.new
    test_piece = Bishop.new("white", [2, 0])
    game.board[2][0] = test_piece
    it "should calculate possible moves" do
      expect(test_piece.possible_moves(game)).to eq([[3, 1], [4, 2], [5, 3], [6, 4], [7, 5], [1, 1], [0, 2]])
    end
  end
end
