require_relative '../lib/game.rb'
require_relative '../lib/console.rb'

console = Console.new
board = Board.new
rules = Rules.new
game = Game.new(board, console, rules)
game.welcome
game.play
