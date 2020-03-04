require_relative 'board'
require_relative 'console'
require_relative 'rules'

class Game
  def initialize(board, console)
    @board = board
    @console = console
  end

  def welcome
    @console.print_message('Welcome to Tic Tac Toe')
  end

  def play
    loop do
      @console.print_message(@board.display)
      @console.print_message('Please enter a number 1-9')
      index = @console.retrieve_user_input.to_i - 1
      @board.position_taken?(index) ? play : @board.mark(index)
      @console.print_message(@board.display)
      break if Rules.game_over?(@board)
    end
  end
end
