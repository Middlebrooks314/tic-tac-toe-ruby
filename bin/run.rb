require 'require_all'
require_all 'lib'

console = Console.new
board = Board.new
rules = Rules.new(board)
display = Display.new(console, board)
game_factory = GameFactory.new(board, display, rules)
game_factory.create_game
