require_relative 'board'
require_relative 'console'

class Game
  def initialize(board, console = Console.new)
    @board = board
    @console = console
  end

  def welcome
    @console.print_message('Welcome to Tic Tac Toe')
  end

  def play
    @console.print_message(@board.display)
    @console.print_message('Please enter a number 1-9')
    index = @console.retrieve_user_input.to_i - 1
    @board.position_taken?(index) ? play : @board.mark(index)
    @console.print_message(@board.display)
  end

  def game_over?
    @board.winning_combination? || @board.full?
  end
end
