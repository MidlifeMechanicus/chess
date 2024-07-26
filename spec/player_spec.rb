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

  describe "#move_piece" do
    # This is far more integration testing than unit testing, as this method is the work-flow controller.
    # It calls many other functions.
    # While I have tested the various components, I cannot create an rspec test that properly examines the workflow.
  end

  describe "#check_promotion" do
    game = Game.new
    game.set_board
    white_player = Player.new("white")
    it "should not call #promote on an empty square" do
      expect(game.board[4][4]).not_to receive(:promote).with(game)
      white_player.check_promotion(game)
    end
    # it "should not call #promote on a non-Pawn square" do
    #   expect(game.board[4][0]).not_to receive(:promote).with(game)
    #   white_player.check_promotion(game)
    #   This application can't be tested because rspec keeps throwing an error when testing non-pawn picees.
    #   This is because those pieces do not have the #promote method, so it could not be called in any event.
    # end
    it "should not call #promote on an enemy Pawn" do
      expect(game.board[0][6]).not_to receive(:promote).with(game)
      white_player.check_promotion(game)
    end
    it "should call #promote on an ally Pawn" do
      expect(game.board[0][1]).to receive(:promote).with(game)
      white_player.check_promotion(game)
    end
  end

  describe "#check_enpassant" do
    # For clarity, this method runs AFTER the move has been made.
    context "a new game with a single pawn has been created" do
      game = Game.new
      game.board[4][3] = Pawn.new("white", [4, 3])
      move = [4, 1, 4, 3]
      white_player = Player.new("white")
      it "should mark a Pawn that has moved two spaces as 'en passant'" do
        white_player.check_en_passant(game, move)
        expect(game.board[4][3].en_passant).to be true
      end
      it "should not mark a Pawn that has moved less than two spaces as 'en passant'" do
        game.board[4][3] = Pawn.new("white", [4, 3])
        move = [4, 2, 4, 3]
        white_player.check_en_passant(game, move)
        expect(game.board[4][3].en_passant).to be false
      end
      it "should not act when a non-Pawn piece has moved" do
        game.board[4][3] = Piece.new("white", [4, 3])
        expect(white_player.check_en_passant(game, move)).to be nil
      end
    end
    context "a new game with a single white pawn has been created" do
      game = Game.new
      game.board[5][5] = Pawn.new("white", [5, 5])
      move = [4, 4, 5, 5]
      white_player = Player.new("white")
      it "should remove an enemy Pawn marked 'en passant' directly behind the moving Pawn" do
        game.board[5][4] = Pawn.new("black", [5, 4])
        game.board[5][4].en_passant = true
        white_player.check_en_passant(game, move)
        expect(game.board[5][4]).to be nil
      end
      it "should not remove an enemy Pawn marked not 'en passant' directly behind the moving Pawn" do
        game.board[5][4] = Pawn.new("black", [5, 4])
        game.board[5][4].en_passant = false
        white_player.check_en_passant(game, move)
        expect(game.board[5][4].class).to be Pawn
        expect(game.board[5][4].color).to eq("black")
      end
    end
    context "a new game with a single black pawn has been created" do
      game = Game.new
      game.board[5][2] = Pawn.new("black", [5, 2])
      move = [4, 3, 5, 2]
      black_player = Player.new("black")
      it "should remove an enemy Pawn marked 'en passant' directly behind the moving Pawn" do
        game.board[5][3] = Pawn.new("white", [5, 4])
        game.board[5][3].en_passant = true
        black_player.check_en_passant(game, move)
        expect(game.board[5][3]).to be nil
      end
      it "should not remove an enemy Pawn marked not 'en passant' directly behind the moving Pawn" do
        game.board[5][3] = Pawn.new("white", [5, 4])
        game.board[5][3].en_passant = false
        black_player.check_en_passant(game, move)
        expect(game.board[5][3].class).to be Pawn
        expect(game.board[5][3].color).to eq("white")
      end
    end
    describe "#clear_en_passant" do
      context "a new game, two players, each with one pawn" do
        game = Game.new
        game.board[0][0] = Pawn.new("white", [0, 0])
        game.board[7][7] = Pawn.new("black", [7, 7])
        white_player = Player.new("white")
        black_player = Player.new("black")
        it "should clear en passant only from white Pawns when called by the white player" do
          game.board[0][0].en_passant = true
          game.board[7][7].en_passant = true
          white_player.clear_en_passant(game)
          expect(game.board[0][0].en_passant).to be false
          expect(game.board[7][7].en_passant).to be true
        end
        it "should clear en passant only from black Pawns when called by the black player" do
          game.board[0][0].en_passant = true
          game.board[7][7].en_passant = true
          black_player.clear_en_passant(game)
          expect(game.board[0][0].en_passant).to be true
          expect(game.board[7][7].en_passant).to be false
        end
      end
    end
    describe "#check_castle" do
      context "a new game with two players, Rooks in their corners" do
        game = Game.new
        game.board[0][0] = Rook.new("white", [0, 0])
        game.board[7][0] = Rook.new("white", [7, 0])
        game.board[0][7] = Rook.new("black", [0, 7])
        game.board[7][7] = Rook.new("black", [7, 7])
        white_player = Player.new("white")
        black_player = Player.new("black")
        it "should detect when the white King has castled Kingside" do
          move = [4, 0, 6, 0]
          game.board[6][0] = King.new("white", [6, 0])
          white_player.check_castle(game, move)
          expect(game.board[5][0].class).to be Rook
          expect(game.board[5][0].color).to eq("white")
          expect(game.board[7][0]).to be nil
        end
        it "should detect when the white King has castled Queenside" do
          move = [4, 0, 2, 0]
          game.board[2][0] = King.new("white", [2, 0])
          white_player.check_castle(game, move)
          expect(game.board[3][0].class).to be Rook
          expect(game.board[3][0].color).to eq("white")
          expect(game.board[0][0]).to be nil
        end
        it "should detect when the black King has castled Kingside" do
          move = [4, 7, 6, 7]
          game.board[6][7] = King.new("black", [6, 7])
          black_player.check_castle(game, move)
          expect(game.board[5][7].class).to be Rook
          expect(game.board[5][7].color).to eq("black")
          expect(game.board[7][7]).to be nil
        end
        it "should detect when the black King has castled Queenside" do
          move = [4, 7, 2, 7]
          game.board[2][7] = King.new("black", [2, 7])
          black_player.check_castle(game, move)
          expect(game.board[3][7].class).to be Rook
          expect(game.board[3][7].color).to eq("black")
          expect(game.board[0][7]).to be nil
        end
      end
    end
  end
end
