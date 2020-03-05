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
    retrieve_user_move
    console.print_message(@board.display)
    switch_players
  end

  def retrieve_user_move
    console.print_message("Player #{@current_player}, please enter a position 1-9 that is not already marked")
    index = @console.retrieve_user_input.to_i - 1
    board.valid_move?(index) ? @board.mark(index, @current_player) : retrieve_user_move
  end

  def switch_players
    if !rules.game_over?(board)
      @current_player == 'X' ? @current_player = 'O' : @current_player = 'X'
    end
  end

  def play
    turn until rules.game_over?(board)
    game_over_message
  end

  def alert_current_player
    console.print_message("It is #{@current_player}\'s turn")
  end

  def winner
    if rules.winning_combination?(board)
      @current_player
    end
  end

  def game_over_message
    console.print_message (winner ? "Congratulations #{@current_player}!" : 'Draw!')
  end
end
