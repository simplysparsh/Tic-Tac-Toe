class UserMessages

  def game_over
    "The Game is Over"
  end

  def ask_for_move(player)
    "#{player}, please enter your choice [0 to 8]:"
  end

  def play_valid_move
    "Enter a valid block: from 0 to 8 and unoccupied"
  end

  def announce_winner(player)
    "Good game! #{player} wins! "
  end

  def ask_to_wait
    "One moment please!"
  end

  def welcome
    "Welcome to Tic-Tac-Toe ! Would you like to play a game ? (Y/N)"
  end

  def ask_for_another_game
    "\nDo you wan't to play another game ? (Y/N) "
  end

  def invalid_entry
    "Invalid Entry. Please check and re-enter."
  end

  def ask_for_game_mode
    "Do you want to play single player(Y/N) ? (Yes: Single Player / No: Two-Player) "
  end

end
