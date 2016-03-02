require "rspec"
require "user_messages.rb"

describe UserMessages do
  let(:message) { UserMessages.new }

  describe "#game_over" do
    it "returns a game over message" do
      expect(message.game_over).to match /The Game is Over/i
    end
  end

  describe "#ask_for_move" do
    let(:player) { "player_name" }
    it "asks to enter a choice" do
      expect(message.ask_for_move(player)). to match /Please enter/i
    end
  end

  describe "#play_valid_move" do
    it "asks to play a valid move" do
      expect(message.play_valid_move). to match /Enter a valid block/i
    end
  end

  describe "#announce_winner" do
    let(:player) { "computer" }
    it "announces the winner" do
      expect(message.announce_winner(player)). to match /wins/i
    end
  end

  describe "#ask_to_wait" do
    it "asks the user to wait" do
      expect(message.ask_to_wait). to match /One moment please/i
    end
  end


  describe "#welcome" do
    it "welcomes the user to the game" do
      expect(message.welcome). to match /welcome/i
    end
  end

  describe "#ask_for_another_game" do
    it "asks if the user wants to continue playing" do
      expect(message.ask_for_another_game). to match /play another game /i
    end
  end

  describe "#invalid_entry" do
    it "informs user about invalid entry" do
      expect(message.invalid_entry). to match /Invalid Entry/i
    end
  end

  describe "#ask_for_game_mode" do
    it "asks if user wants to play single-player or multi-player" do
      expect(message.ask_for_game_mode). to match /want to play single player ?/i
    end
  end

end