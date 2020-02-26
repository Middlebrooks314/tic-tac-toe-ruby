require_relative '../lib/game.rb'
require_relative '../lib/console.rb'
require_relative '../lib/game_runner.rb'

# runner = GameRunner.new(Console.new)
# runner.run
console = Console.new
board = Board.new

game = Game.new(board, console)
game.welcome
game.play
