require_relative '../lib/game.rb'
require_relative '../lib/console.rb'

console = Console.new
board = Board.new

game = Game.new(board, console)
game.welcome
game.play
