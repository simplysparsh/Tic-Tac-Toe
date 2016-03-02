require "rspec"
require "computer.rb"
require "board.rb"
require "user.rb"

describe Computer do
  let(:computer_marker) {"X"}
  let(:user_marker) {"O"}
  let(:computer) { Computer.new(computer_marker) }
  let(:board) { Board.new }
  let(:test_user) { User.new("Test User", user_marker) }

  describe '#play' do

    context "when the board is not rigged" do
      it "prevents the opponent from winning" do
        board.fill_block_at('4', 'O')
        board.fill_block_at('2', 'X')
        board.fill_block_at('7', 'O')
        expect(computer.play(board, test_user)).to eq('1')
      end

      it "gives a winning move whenever possible" do
        board.fill_block_at('4', 'O')
        board.fill_block_at('0', 'X')
        board.fill_block_at('3', 'O')
        board.fill_block_at('2', 'X')
        board.fill_block_at('6', 'O')
        expect(computer.play(board, test_user)).to eq('1')
      end

      it "blocks the opponent's corner fork" do
        board.fill_block_at('2', 'O')
        board.fill_block_at('4', 'X')
        board.fill_block_at('6', 'O')
        expect(computer.play(board, test_user)).to eq('7')
      end

      it "blocks the opponent's center fork" do
        board.fill_block_at('4', 'O')
        board.fill_block_at('6', 'X')
        board.fill_block_at('2', 'O')
        expect(computer.play(board, test_user)).to eq('8')
      end

    end

    context "when the board is rigged" do
      before do
        board.fill_block_at('1', 'O')
        board.fill_block_at('6', 'X')
        board.fill_block_at('5', 'O')
        board.fill_block_at('7', 'X')
        board.fill_block_at('8', 'O')
      end

      it "tries to delay opponent's victory" do
        expect(computer.play(board, test_user)).to eq('2')
      end
      # The depth counter helps us win with least possible moves
      # and delays opponents victory as much as possible. Hence,
      # in a rigged board, it will try to win till the very last.
    end

  end

end