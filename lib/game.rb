require_relative 'board'
require_relative 'console'
require_relative 'rules'
require_relative 'human_player'
require_relative 'dumb_player'

class Game
  attr_accessor :board, :console, :rules

  def initialize(board, console, rules, player_one, player_two)
    @board = board
    @console = console
    @rules = rules
    @player_one = player_one
    @player_two = player_two
    @current_player = @player_one
  end

  def welcome
    console.print_message('Welcome to Tic Tac Toe')
  end

  def turn
    alert_current_player
    @board.mark(@current_player.move, @current_player.mark)
    console.print_message(@board.display)
    switch_players
  end

  def play
    turn until rules.game_over?(board)
    game_over_message
  end

  def alert_current_player
    console.print_message("It is #{@current_player.mark}\'s turn")
  end

  def game_over_message
    console.print_message (winner ? "Congratulations #{@current_player.mark}!" : 'Draw!')
  end

  private

  def switch_players
    if !rules.game_over?(board)
      @current_player == @player_one ? @current_player = @player_two : @current_player = @player_one
    end
  end

  def winner
    if rules.winning_combination?(board)
      @current_player
    end
  end
end
