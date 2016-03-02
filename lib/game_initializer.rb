require_relative 'user_messages'

class GameInitializer

  def initialize
    @message = UserMessages.new
  end

  attr_reader :player1, :player2

  def start_new_game?
    get_user_response == 'y'
  end

  def create_players
    @game_mode = get_game_mode
    player_name = get_player_names
    marker = get_player_markers(player_name[0])
    @player1 = User.new(player_name[0], marker[0])

    if @game_mode == 'mode_multi'
      @player2 = User.new(player_name[1], marker[1])
    else
      @player2 = Computer.new(marker[1])
    end
  end

  private

  def get_game_mode
    puts @message.ask_for_game_mode
    return 'mode_single' if get_user_response == 'y'
    'mode_multi'
  end

  def get_player_names
    names = []
    puts "Enter player 1 name"
    names[0] = gets.chomp

    if @game_mode == 'mode_multi'
      puts "Enter player 2 name"
      names[1] = gets.chomp
    end
    names
  end

  def get_player_markers(player1_name)
    marker = []
    valid_markers = ['X', 'O']

    puts "#{player1_name}, select your marker (X / O):"
    marker[0] = gets.chomp.upcase
    if marker_valid?(marker[0], valid_markers)
      marker[1] = valid_markers.find {|mark| mark != marker[0]}
    else
      puts @message.invalid_entry
      get_player_markers(player1_name)
    end
    marker
  end

  def marker_valid?(marker, valid_markers)
    true if valid_markers.include? marker
  end

  def get_user_response
    response = gets.chomp
    if ['y', 'Y', 'n', 'N'].include? response
      response.downcase
    else
      puts @message.invalid_entry
      get_user_response
    end
  end

end