require_relative 'board'
require_relative 'rules'
require_relative 'human_player'

class Game
  attr_reader :rules

  def initialize(display, rules, player_one, player_two)
    @rules = rules
    @display = display
    @player_one = player_one
    @player_two = player_two
    @current_player = @player_one
  end

  def start
    @display.welcome
    play
  end

  def turn
    @display.alert_current_player(@current_player)
    @current_player.move
    @display.board
    switch_players
  end

  def play
    @display.board
    turn until rules.game_over?
    game_over_message
  end

  def game_over_message
    winner ? @display.winner_message(@current_player.mark) : @display.draw_message
  end

  private

  def switch_players
    if !rules.game_over?
      @current_player == @player_one ? @current_player = @player_two : @current_player = @player_one
    end
  end

  def winner
    @current_player if rules.winning_combination?
  end
end
