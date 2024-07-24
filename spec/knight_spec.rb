# Tests behaviour of Knight.
require "./lib/main/piece/knight"

describe Knight do
  describe "#initialize" do
    context "a new piece has been created" do
      white_knight = Knight.new("white", [1, 0])
      black_knight = Knight.new("black", [1, 7])
      it "should have a position" do
        expect(white_knight.position).to eq([1, 0])
        expect(black_knight.position).to eq([1, 7])
      end
      it "should have a color" do
        expect(white_knight.color).to eq("white")
        expect(black_knight.color).to eq("black")
      end
      it "should have a display" do
        expect(white_knight.display).to eq("\e[38;2;255;255;255m♞\e[0m")
        expect(black_knight.display).to eq("\e[38;2;255;0;0m♞\e[0m")
      end
      it "should have a move matrix" do
        expect(white_knight.matrix).to eq([[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]])
        expect(black_knight.matrix).to eq([[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]])
      end
    end
  end
  describe "#possible_moves" do
    game = Game.new
    white_knight = Knight.new("white", [1, 0])
    game.board[1][0] = white_knight
    it "should calculate possible moves, taking into account board edges" do
      expect(white_knight.possible_moves(game)).to eq([[2, 2], [3, 1], [0, 2]])
    end
    it "should calculte possible moves when no board edges are nearby" do
      black_knight = Knight.new("black", [5, 5])
      game.board[5][5] = black_knight
      expect(black_knight.possible_moves(game)).to eq([[6, 7], [7, 6], [7, 4], [6, 3], [4, 3], [3, 4], [3, 6], [4, 7]])
    end
  end
end
