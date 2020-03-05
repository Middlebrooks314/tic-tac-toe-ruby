require_relative 'board'
require_relative 'console'
require_relative 'rules'

class Game
  def initialize(board, console, rules)
    @board = board
    @console = console
    @current_player = 'X'
    @rules = rules
  end

  def welcome
    @console.print_message('Welcome to Tic Tac Toe')
  end

  def turn
    @console.print_message('Please enter a number 1-9')
    index = @console.retrieve_user_input.to_i - 1
    @board.position_taken?(index) ? turn : @board.mark(index, @current_player)
    @console.print_message(@board.display)
    switch_players
  end

  def switch_players
    @current_player == 'X' ? @current_player = 'O' : @current_player = 'X'
  end

  def play
    @console.print_message(@board.display)
    turn until @rules.game_over?(@board)
    @console.print_message('Game Over')
  end
end
