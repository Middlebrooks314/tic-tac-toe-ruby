class GameFactory
  attr_reader :player_one, :player_two

  def initialize(board, display, rules, menu)
    @board = board
    @display = display
    @rules = rules
    @menu = menu
  end

  def create_game
    @display.welcome
    player_selections
    player_choices
    Game.new(@display, @rules, @player_one, @player_two)
  end

  private

  def player_selections
    @player_one_option = @menu.player_choice('first')
    @player_two_option = @menu.player_choice('second')
  end

  def player_choices
    player_one_mark = create_mark
    player_two_mark = create_mark(player_one_mark, 2)
    @player_one = create_player(@player_one_option, player_one_mark)
    @player_two = create_player(@player_two_option, player_two_mark)
  end

  def create_player(player_option, mark)
    case player_option
    when '1'
      player = HumanPlayer.new(mark, @board, @display)
    when '2'
      player = ComputerPlayer.new(mark, @board, @display)
    end
    player
  end

  def create_mark(other_mark = nil, player_number = 1)
    @display.setup_mark_message(player_number)
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
    potential_mark.length == 1 && potential_mark != other_mark
  end
end
