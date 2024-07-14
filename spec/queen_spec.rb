# Tests behaviour of Queen. # ,
require "./lib/main/piece/queen"

describe Queen do
  describe "#initialize" do
    context "a new piece has been created" do
      black_queen = Queen.new("black", [3, 7])
      it "should have a position" do
        expect(black_queen.position).to eq([3, 7])
      end
      it "should have a color" do
        expect(black_queen.color).to eq("black")
      end
      it "should have a display" do
        expect(black_queen.display).to eq("\e[38;2;255;0;0m♕\e[0m")
      end
      it "should have a move matrix" do
        expect(black_queen.matrix).to eq([[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1],
                                          [0, 2], [2, 2], [2, 0], [2, -2], [0, -2], [-2, -2], [-2, 0], [-2, 2],
                                          [0, 3], [3, 3], [3, 0], [3, -3], [0, -3], [-3, -3], [-3, 0], [-3, 3],
                                          [0, 4], [4, 4], [4, 0], [4, -4], [0, -4], [-4, -4], [-4, 0], [-4, 4],
                                          [0, 5], [5, 5], [5, 0], [5, -5], [0, -5], [-5, -5], [-5, 0], [-5, 5],
                                          [0, 6], [6, 6], [6, 0], [6, -6], [0, -6], [-6, -6], [-6, 0], [-6, 6],
                                          [0, 7], [7, 7], [7, 0], [7, -7], [0, -7], [-7, -7], [-7, 0], [-7, 7]])
      end
      it "should calculate possible moves" do
        expect(black_queen.possible_moves).to eq([[4, 7], [4, 6], [3, 6], [2, 6], [2, 7], [5, 7], [5, 5], [3, 5],
                                                  [1, 5], [1, 7], [6, 7], [6, 4], [3, 4], [0, 4], [0, 7], [7, 7], [7, 3],
                                                  [3, 3], [3, 2], [3, 1], [3, 0]])
      end
    end
  end
end
