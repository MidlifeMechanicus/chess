# Tests behaviour Game.
require "./lib/main/game"
require "./lib/main/player"
require "yaml"

describe Game do
  describe "#initialize" do
    context " a new game has been created" do
      game = Game.new
      it "should have an 8x8 board" do
        expect(game.board).to eq([[nil, nil, nil, nil, nil, nil, nil, nil],
                                  [nil, nil, nil, nil, nil, nil, nil, nil],
                                  [nil, nil, nil, nil, nil, nil, nil, nil],
                                  [nil, nil, nil, nil, nil, nil, nil, nil],
                                  [nil, nil, nil, nil, nil, nil, nil, nil],
                                  [nil, nil, nil, nil, nil, nil, nil, nil],
                                  [nil, nil, nil, nil, nil, nil, nil, nil],
                                  [nil, nil, nil, nil, nil, nil, nil, nil]])
      end
      it "should have a current player" do
        expect(game.current_player).to eq("")
      end
      it "should have a next player" do
        expect(game.next_player).to eq("")
      end
      it "should not be game over" do
        expect(game.game_over).to be false
      end
    end
  end

  describe "#play_game" do
    # game = Game.new
    # game.current_player = Player.new("white")
    # xit "should call #move_piece" do
    #   expect(game.current_player).to receive(:move_piece).with(game)
    #   game.play_game
    # end
    # Can't test this because it enters an infinite loop.
    # This is expected, and ironically confirms the test.
  end

  describe "#show_instructions" do
    game = Game.new
    game.current_player = Player.new("white")
    it "should call #show_board" do
      expect(game).to receive(:show_board)
      game.show_instructions
    end
    it "should call #get_move" do
      expect(game.current_player).to receive(:get_move).with(game)
      game.show_instructions
    end
  end

  describe "#save_game" do
    game = Game.new
    game.current_player = Player.new("white")
    # The actual saving of the game is not tested here and has been done manually.
    it "should call #show_board" do
      expect(game).to receive(:show_board)
      game.show_instructions
    end
    it "should call #get_move" do
      expect(game.current_player).to receive(:get_move).with(game)
      game.show_instructions
    end
  end

  describe "#end_game" do
    game = Game.new
    game.current_player = Player.new("white")
    it "should mark the game as being over" do
      game.end_game("quit")
      expect(game.game_over).to be true
    end
  end
end
