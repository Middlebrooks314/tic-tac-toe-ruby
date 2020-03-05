require_relative 'board'
require_relative 'console'
require_relative 'rules'

class Game
  attr_accessor :board, :console, :rules

  def initialize(board, console, rules)
    @board = board
    @console = console
    @current_player = 'X'
    @rules = rules
  end

  def welcome
    console.print_message('Welcome to Tic Tac Toe')
  end

  def turn
    alert_current_player
    console.print_message("Player #{@current_player}, please enter a number 1-9")
    index = @console.retrieve_user_input.to_i - 1
    board.position_taken?(index) ? turn : @board.mark(index, @current_player)
    console.print_message(@board.display)
    switch_players
  end

  def switch_players
    @current_player == 'X' ? @current_player = 'O' : @current_player = 'X'

  end

  def play
    console.print_message(board.display)
    turn until rules.game_over?(board)
    game_over_message
  end

  def alert_current_player
    console.print_message("It is #{@current_player}\'s turn")
  end

  def game_over_message
    console.print_message('Game Over')
  end
end
