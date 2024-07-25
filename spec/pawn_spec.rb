# Tests behaviour of Pawns.
require "./lib/main/piece/pawn"
require "./lib/main/piece/queen"
require "./lib/main/piece/bishop"
require "./lib/main/piece/knight"
require "./lib/main/piece/rook"

describe Pawn do
  describe "#initialize" do
    context "new pieces have been created" do
      white_pawn = Pawn.new("white", [3, 1])
      black_pawn = Pawn.new("black", [3, 6])
      it "should have a position" do
        expect(white_pawn.position).to eq([3, 1])
        expect(black_pawn.position).to eq([3, 6])
      end
      it "should have a color" do
        expect(white_pawn.color).to eq("white")
        expect(black_pawn.color).to eq("black")
      end
      it "should have a display" do
        expect(white_pawn.display).to eq("\e[38;2;255;255;255m♙\e[0m")
        expect(black_pawn.display).to eq("\e[38;2;255;0;0m♙\e[0m")
      end
      it "should not have a move matrix" do
        expect(white_pawn.matrix).to eq([])
        expect(black_pawn.matrix).to eq([])
      end
    end
  end

  describe "#set_matrix" do
    context "a new game an a single black pawn" do
      game = Game.new
      game.board[4][6] = Pawn.new("black", [4, 6])
      black_pawn = game.board[4][6]
      it "should have a basic move matrix if marked as having moved" do
        black_pawn.has_moved = true
        black_pawn.set_matrix(game)
        expect(black_pawn.matrix).to eq([[0, -1]])
      end
      it "should have an extended move matrix if marked as not having moved" do
        black_pawn.has_moved = false
        black_pawn.set_matrix(game)
        expect(black_pawn.matrix).to eq([[0, -1], [0, -2]])
      end
      it "should not detect an extended move onto an ally piece" do
        game.board[4][4] = Piece.new("black", [4, 4])
        black_pawn.set_matrix(game)
        expect(black_pawn.matrix).to eq([[0, -1]])
      end
      it "should not detect an extended move onto an enemy piece" do
        game.board[4][4] = Piece.new("white", [4, 4])
        black_pawn.set_matrix(game)
        expect(black_pawn.matrix).to eq([[0, -1]])
      end
      it "should not detect an normal move onto an ally piece" do
        game.board[4][5] = Piece.new("black", [4, 5])
        black_pawn.set_matrix(game)
        expect(black_pawn.matrix).to eq([])
      end
      it "should not detect an normal move onto an enemy piece" do
        game.board[4][5] = Piece.new("white", [4, 5])
        black_pawn.set_matrix(game)
        expect(black_pawn.matrix).to eq([])
      end
      it "should detect a diagonal move onto an enemy piece" do
        game.board[3][5] = Piece.new("white", [3, 5])
        game.board[5][5] = Piece.new("white", [5, 5])
        black_pawn.set_matrix(game)
        expect(black_pawn.matrix).to eq([[-1, -1], [1, -1]])
      end
      it "should not detect a diagonal move onto an ally piece" do
        game.board[3][5] = Piece.new("black", [3, 5])
        game.board[5][5] = Piece.new("black", [5, 5])
        black_pawn.set_matrix(game)
        expect(black_pawn.matrix).to eq([])
      end
    end
    context "a new game an a single white pawn" do
      game = Game.new
      game.board[4][1] = Pawn.new("white", [4, 1])
      white_pawn = game.board[4][1]
      it "should have a basic move matrix if marked as having moved" do
        white_pawn.has_moved = true
        white_pawn.set_matrix(game)
        expect(white_pawn.matrix).to eq([[0, 1]])
      end
      it "should have an extended move matrix if marked as not having moved" do
        white_pawn.has_moved = false
        white_pawn.set_matrix(game)
        expect(white_pawn.matrix).to eq([[0, 1], [0, 2]])
      end
      it "should not detect an extended move onto an ally piece" do
        game.board[4][3] = Piece.new("white", [4, 3])
        white_pawn.set_matrix(game)
        expect(white_pawn.matrix).to eq([[0, 1]])
      end
      it "should not detect an extended move onto an enemy piece" do
        game.board[4][3] = Piece.new("black", [4, 3])
        white_pawn.set_matrix(game)
        expect(white_pawn.matrix).to eq([[0, 1]])
      end
      it "should not detect an normal move onto an ally piece" do
        game.board[4][2] = Piece.new("white", [4, 2])
        white_pawn.set_matrix(game)
        expect(white_pawn.matrix).to eq([])
      end
      it "should not detect an normal move onto an enemy piece" do
        game.board[4][2] = Piece.new("black", [4, 2])
        white_pawn.set_matrix(game)
        expect(white_pawn.matrix).to eq([])
      end
      it "should detect a diagonal move onto an enemy piece" do
        game.board[3][2] = Piece.new("black", [3, 2])
        game.board[5][2] = Piece.new("black", [5, 2])
        white_pawn.set_matrix(game)
        expect(white_pawn.matrix).to eq([[-1, 1], [1, 1]])
      end
      it "should not detect a diagonal move onto an ally piece" do
        game.board[3][2] = Piece.new("white", [3, 2])
        game.board[5][2] = Piece.new("white", [5, 2])
        white_pawn.set_matrix(game)
        expect(white_pawn.matrix).to eq([])
      end
    end
    context "a new game with a black and white pawn" do
      game = Game.new
      game.board[4][1] = Pawn.new("white", [4, 1])
      white_pawn = game.board[4][1]
      game.board[4][6] = Pawn.new("black", [4, 6])
      black_pawn = game.board[4][6]
      it "should not detect en passant moves for horizontal ally pawns" do
        game.board[3][1] = Pawn.new("white", [3, 1])
        game.board[5][1] = Pawn.new("white", [5, 1])
        game.board[3][6] = Pawn.new("black", [3, 6])
        game.board[5][6] = Pawn.new("black", [5, 6])
        white_pawn.set_matrix(game)
        black_pawn.set_matrix(game)
        expect(white_pawn.matrix).to eq([[0, 1], [0, 2]])
        expect(black_pawn.matrix).to eq([[0, -1], [0, -2]])
      end
      it "should not detect en passant moves for horizontal enemy pawns not marked en passant" do
        game.board[3][1] = Pawn.new("black", [3, 1])
        game.board[5][1] = Pawn.new("black", [5, 1])
        game.board[3][6] = Pawn.new("white", [3, 6])
        game.board[5][6] = Pawn.new("white", [5, 6])
        white_pawn.set_matrix(game)
        black_pawn.set_matrix(game)
        expect(white_pawn.matrix).to eq([[0, 1], [0, 2]])
        expect(black_pawn.matrix).to eq([[0, -1], [0, -2]])
      end
      it "should detect en passant moves for horizontal enemy pawns marked en passant" do
        game.board[3][1] = Pawn.new("black", [3, 1])
        game.board[5][1] = Pawn.new("black", [5, 1])
        game.board[3][6] = Pawn.new("white", [3, 6])
        game.board[5][6] = Pawn.new("white", [5, 6])
        game.board[3][1].en_passant = true
        game.board[5][1].en_passant = true
        game.board[3][6].en_passant = true
        game.board[5][6].en_passant = true
        white_pawn.set_matrix(game)
        black_pawn.set_matrix(game)
        expect(white_pawn.matrix).to eq([[0, 1], [0, 2], [-1, 1], [1, 1]])
        expect(black_pawn.matrix).to eq([[0, -1], [0, -2], [-1, -1], [1, -1]])
      end
    end
  end

  describe "#possible_moves" do
    context "a new game with a single pawn" do
      game = Game.new
      test_piece = Pawn.new("white", [4, 1])
      game.board[4][1] = test_piece
      it "should call #set_matrix" do
        expect(test_piece).to receive(:set_matrix).with(game)
        test_piece.possible_moves(game)
      end
      it "should calculate possible moves" do
        expect(test_piece.possible_moves(game)).to eq([[4, 2], [4, 3]])
      end
      it "should calculate reduced possible moves after first move" do
        test_piece.has_moved = true
        expect(test_piece.possible_moves(game)).to eq([[4, 2]])
      end
      it "should calculate additional possible moves for enemy occupied diagonals" do
        game.board[5][2] = Pawn.new("black", [5, 2])
        game.board[3][2] = Pawn.new("black", [3, 2])
        expect(test_piece.possible_moves(game)).to eq([[4, 2], [3, 2], [5, 2]])
      end
      it "should not calculate additional possible moves for ally occupied diagonals" do
        game.board[5][2] = Pawn.new("white", [5, 2])
        game.board[3][2] = Pawn.new("white", [3, 2])
        expect(test_piece.possible_moves(game)).to eq([[4, 2]])
      end
      it "should not show any possible moves if blocked" do
        game.board[4][2] = Pawn.new("black", [4, 2])
        expect(test_piece.possible_moves(game)).to eq([])
      end
    end
  end

  describe "#promote" do
    context "a new game with a black pawn and a white pawn" do
      game = Game.new
      it "should not promote pawns not at final rank" do
        game.board[0][1] = Pawn.new("white", [0, 1])
        game.board[7][6] = Pawn.new("black", [7, 6])
        white_pawn = game.board[0][1]
        black_pawn = game.board[7][6]
        expect(white_pawn.promote(game)).to be nil
        expect(black_pawn.promote(game)).to be nil
      end
      it "should promote final rank pawns to queens when it gets 'queen'" do
        game.board[0][7] = Pawn.new("white", [0, 7])
        game.board[7][0] = Pawn.new("black", [7, 0])
        white_pawn = game.board[0][7]
        black_pawn = game.board[7][0]
        allow(white_pawn).to receive(:gets).and_return("queen")
        allow(black_pawn).to receive(:gets).and_return("queen")
        white_pawn.promote(game)
        black_pawn.promote(game)
        expect(game.board[0][7].class).to eq(Queen)
        expect(game.board[0][7].color).to eq("white")
        expect(game.board[7][0].class).to eq(Queen)
        expect(game.board[7][0].color).to eq("black")
      end
      it "should promote final rank pawns to bishops when it gets 'bishop'" do
        game.board[0][7] = Pawn.new("white", [0, 7])
        game.board[7][0] = Pawn.new("black", [7, 0])
        white_pawn = game.board[0][7]
        black_pawn = game.board[7][0]
        allow(white_pawn).to receive(:gets).and_return("bishop")
        allow(black_pawn).to receive(:gets).and_return("bishop")
        white_pawn.promote(game)
        black_pawn.promote(game)
        expect(game.board[0][7].class).to eq(Bishop)
        expect(game.board[0][7].color).to eq("white")
        expect(game.board[7][0].class).to eq(Bishop)
        expect(game.board[7][0].color).to eq("black")
      end
      it "should promote final rank pawns to queens when it gets 'knight'" do
        game.board[0][7] = Pawn.new("white", [0, 7])
        game.board[7][0] = Pawn.new("black", [7, 0])
        white_pawn = game.board[0][7]
        black_pawn = game.board[7][0]
        allow(white_pawn).to receive(:gets).and_return("knight")
        allow(black_pawn).to receive(:gets).and_return("knight")
        white_pawn.promote(game)
        black_pawn.promote(game)
        expect(game.board[0][7].class).to eq(Knight)
        expect(game.board[0][7].color).to eq("white")
        expect(game.board[7][0].class).to eq(Knight)
        expect(game.board[7][0].color).to eq("black")
      end
      it "should promote final rank pawns to queens when it gets 'rook'" do
        game.board[0][7] = Pawn.new("white", [0, 7])
        game.board[7][0] = Pawn.new("black", [7, 0])
        white_pawn = game.board[0][7]
        black_pawn = game.board[7][0]
        allow(white_pawn).to receive(:gets).and_return("rook")
        allow(black_pawn).to receive(:gets).and_return("rook")
        white_pawn.promote(game)
        black_pawn.promote(game)
        expect(game.board[0][7].class).to eq(Rook)
        expect(game.board[0][7].color).to eq("white")
        expect(game.board[7][0].class).to eq(Rook)
        expect(game.board[7][0].color).to eq("black")
      end
    end
  end
end

# game.board[0][0] = Pawn.new("black", [0,0])
#       game.board[0][0] = Pawn.new("black", [0,0])
