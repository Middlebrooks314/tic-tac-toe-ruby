require_relative '../lib/game.rb'
require_relative '../lib/console.rb'
require_relative '../lib/game_runner.rb'

runner = GameRunner.new(Console.new)
runner.run

# game = Game.new
# game.welcome
