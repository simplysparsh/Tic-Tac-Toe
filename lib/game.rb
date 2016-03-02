require_relative 'board'
require_relative 'user'
require_relative 'computer'
require_relative 'user_messages'


class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
    @message = UserMessages.new
  end

  def run_game
    @board.print
    if @board.tie?
      puts @message.game_over
    elsif @board.player_wins?
      puts @message.announce_winner(get_winner_name)
    else
      get_game_move(@player1)
      @board.print if @player2.id != :computer && !@board.game_over?
      get_game_move(@player2) if !@board.game_over?
      run_game
    end
  end

  def get_user_input(player)
    user_input = player.play
    if is_valid? user_input
       @board.fill_block_at(user_input, player.marker)
    else
      puts @message.play_valid_move
      get_user_input(player)
    end
  end

  def get_computer_input
    computer_input = @player2.play(@board, @player1)
    if is_valid? computer_input
      @board.fill_block_at(computer_input, @player2.marker)
    else
      raise "Computer has sent an invalid input"
    end
  end

  def is_valid?(input)
    input =~ /[[:digit:]]/ &&
    input.to_i.between?(0, 8) &&
    @board.block[input.to_i] != "X" && @board.block[input.to_i] != "O"
  end

  def get_winner_name
    case @board.last_move_marker
      when @player2.marker
         @player2.name
      when @player1.marker
         @player1.name
    end
  end

  def get_game_move(player)
    if player.id == :computer
      puts @message.ask_to_wait
      get_computer_input
    else
      puts @message.ask_for_move(player.name)
      get_user_input(player)
    end
  end

end

