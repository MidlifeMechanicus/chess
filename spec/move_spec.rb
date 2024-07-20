# Tests behaviour of Move module.
require "./lib/main/player"

describe Player do
  describe "#get_move" do
    player = Player.new("black")
    it "should call #show_instructions on getting 'help'" do
      allow(player).to receive(:gets).and_return("help")
      expect(player).to receive(:show_instructions)
      player.get_move
    end
    it "should return downcase letters" do
      allow(player).to receive(:gets).and_return("Ab")
      expect(player.get_move).to eq("ab")
    end
    # xit "should call #check_move otherwise" do
    #   player = Player.new("black")
    #   allow(player).to receive(:gets).and_return("test")
    #   expect(player).to receive(:check_move)
    #   player.get_move
    #   # Since refactor, should return move.
    # end
  end

  describe "#filter_move_string" do
    # This method filters the input string provded by #get_move and returns an array.
    player = Player.new("white")
    it "should remove all non a-h letters" do
      expect(player.filter_move_string("xyz")).to eq([])
    end
    it "should remove all non 1-8 digits" do
      expect(player.filter_move_string("09")).to eq([])
    end
    it "should shift reduce all original 1-8 digits by one" do
      expect(player.filter_move_string("8")).to eq([7])
    end
    it "should convert all a-h letters to 0-7 digits" do
      expect(player.filter_move_string("abc")).to eq([0, 1, 2])
    end
    it "should do all of the above at once" do
      expect(player.filter_move_string("a1h8z0")).to eq([0, 0, 7, 7])
    end
  end

  describe "#piece_valid" do
    game = Game.new
    game.set_board
    black_player = Player.new("black")
    white_player = Player.new("white")
    it "should not detect a valid piece on an empty square" do
      expect(white_player.piece_valid(game, [4, 4, 5, 5])).to be false
      expect(black_player.piece_valid(game, [4, 4, 5, 5])).to be false
    end
    it "should not detect a valid piece on an enemy occupied square" do
      expect(white_player.piece_valid(game, [4, 7, 5, 5])).to be false
      expect(black_player.piece_valid(game, [4, 0, 5, 5])).to be false
    end
    it "should not detect a valid piece on an ally occupied square" do
      expect(white_player.piece_valid(game, [4, 0, 5, 5])).to be true
      expect(black_player.piece_valid(game, [4, 7, 5, 5])).to be true
    end
  end

  describe "#make_move" do
    game = Game.new
    game.set_board
    player = Player.new("black")
    move = [1, 7, 2, 5]
    chosen_piece = game.board[move[0]][move[1]]
    player.make_move(game, move)
    it "should set the starting square to nil" do
      expect(game.board[1][7]).to be nil
    end
    it "should set chosen_piece position to destination coordinates" do
      expect(chosen_piece.position).to eq([2, 5])
    end
    it "should mark chosen_piece as having moved" do
      expect(chosen_piece.has_moved).to be true
    end
    it "should mark the destination square as containing chosen_piece" do
      expect(game.board[2][5]).to eq(chosen_piece)
    end
  end
end
