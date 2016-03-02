require_relative 'game'
require_relative 'game_initializer'

@message = UserMessages.new
@initializer = GameInitializer.new

puts @message.welcome

while @initializer.start_new_game?
  @initializer.create_players
  game = Game.new(@initializer.player1, @initializer.player2)
  game.run_game
  puts @message.ask_for_another_game
end
