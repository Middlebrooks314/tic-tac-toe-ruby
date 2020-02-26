require 'game_runner'
# class FakeConsole
#   attr_reader :last_string_printed

#   def print_message(message)
#     @last_string_printed = message
#   end
# end

# describe GameRunner do
#   describe 'welcome' do
#     it 'welcomes the user to the game' do
#       console = FakeConsole.new
#       board = Board.new
#       runner = GameRunner.new(console, board)

#       runner.run

#       expect(console.last_string_printed).to eq('Welcome to Tic Tac Toe')
#     end
#   end
# end
