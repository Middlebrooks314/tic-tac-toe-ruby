require_relative '../lib/game.rb'
require_relative '../lib/console.rb'

console = Console.new
board = Board.new
rules = Rules.new
player_one = HumanPlayer.new('Q', console, board)
# player_two = HumanPlayer.new('W', console, board)
player_two = DumbPlayer.new
game = Game.new(board, console, rules, player_one, player_two)
game.welcome
game.play
