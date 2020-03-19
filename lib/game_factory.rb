class GameFactory
  attr_reader :player_one, :player_two

  def initialize(board, display, rules)
    @board = board
    @display = display
    @rules = rules
  end

  def create_game
    create_players
    game = Game.new(@display, @rules, @player_one, @player_two)
    game.start
  end

  private

  def create_players
    player_one_mark = create_mark
    player_two_mark = create_mark(player_one_mark)
    @player_one = HumanPlayer.new(player_one_mark, @board, @display)
    @player_two = HumanPlayer.new(player_two_mark, @board, @display)
  end

  def create_mark(other_mark = nil)
    @display.setup_mark_message
    potential_mark = @display.retrieve_user_input
    mark = check_game_mark(potential_mark, other_mark)
    @mark = mark
  end

  def check_game_mark(potential_mark, other_mark)
    until valid_game_piece?(potential_mark, other_mark)
      @display.invalid_mark_message
      potential_mark = @display.retrieve_user_input
    end
    potential_mark
  end

  def valid_game_piece?(potential_mark, other_mark)
    if potential_mark.length > 1 || potential_mark == ' ' || potential_mark == '' || potential_mark == other_mark
      false
    else
      true
    end
  end
end
