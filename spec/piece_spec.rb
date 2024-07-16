# Tests behaviour of Piece.
require "./lib/main/piece"

describe Piece do
  context "a new game has been created" do
    game = Game.new

    describe "#initialize" do
      context "a new piece has been created" do
        piece = Piece.new("black", [1, 1])
        it "should have a position" do
          expect(piece.position).to eq([1, 1])
        end
        it "should have a color" do
          expect(piece.color).to eq("black")
        end
        it "should have a display" do
          expect(piece.display).to eq("X")
        end
        it "should have a matrix" do
          expect(piece.matrix).to eq([[1, 0], [-1, 0]])
        end
      end
    end

    describe "#possible_moves" do
      test_piece = Piece.new("black", [1, 1])
      game.board[1][1] = test_piece
      it "should show full range of horizonal movement" do
        expect(test_piece.possible_moves(game)).to eq([[2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1], [0, 1]])
      end
      it "should not move through a blocking piece" do
        game.board[5][1] = Piece.new("white", [5, 1])
        expect(test_piece.possible_moves(game)).to eq([[2, 1], [3, 1], [4, 1], [5, 1], [0, 1]])
      end
    end

    describe "#check_ally_occupied" do
      test_piece = Piece.new("black", [0, 0])
      game.board[0][0] = test_piece
      game.board[1][1] = Piece.new("black", [1, 1])
      game.board[2][2] = Piece.new("white", [2, 2])

      it "should recognize an ally-occupied square" do
        expect(test_piece.check_ally_occupied(game, [1, 1])).to be true
      end
      it "should recognize an enemy-occupied square is not ally-occupied" do
        expect(test_piece.check_ally_occupied(game, [2, 2])).to be false
      end
      it "should recognize an empty square is not ally-occupied" do
        expect(test_piece.check_ally_occupied(game, [3, 3])).to be false
      end
    end
  end

  context "a new game has been created" do
    game = Game.new
    describe "#check_move_valid" do
      test_piece = Piece.new("black", [1, 1])
      game.board[1][1] = test_piece
      it "should recognize a valid move" do
        expect(test_piece.check_move_valid(game, [7, 1])).to be true
      end
      it "should not move past a blocking piece" do
        ally_piece = Piece.new("black", [6, 1])
        game.board[6][1] = ally_piece
        expect(test_piece.check_move_valid(game, [7, 1])).to be false
      end
      it "should not move onto an ally piece" do
        ally_piece = Piece.new("black", [6, 1])
        game.board[6][1] = ally_piece
        expect(test_piece.check_move_valid(game, [6, 1])).to be false
      end
      it "should move onto an enemy piece" do
        enemy_piece = Piece.new("white", [6, 1])
        game.board[6][1] = enemy_piece
        expect(test_piece.check_move_valid(game, [6, 1])).to be true
      end
    end
  end
end

# ♕♖♗♘♙
