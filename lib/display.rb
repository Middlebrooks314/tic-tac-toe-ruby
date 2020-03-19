class Display
  def initialize(console, board)
    @console = console
    @board = board
  end

  def welcome
    @console.print_message('Welcome to Tic Tac Toe')
  end

  def make_move_message(mark)
    @console.print_message("Player #{mark}, please enter a position 1-9 that is not already marked")
  end

  def retrieve_user_input
    @console.retrieve_user_input
  end

  def alert_current_player(current_player)
    @console.print_message("It is #{current_player.mark}\'s turn")
  end

  def setup_mark_message
    @console.print_message('Please enter a single character to use as your game piece')
  end

  def winner_message(mark)
    @console.print_message("Congratulations #{mark}!")
  end

  def draw_message
    @console.print_message('Draw!')
  end

  def board
    @console.print_message(@board.display)
  end

  def invalid_mark_message
    @console.print_message('Please enter a single character that is unique')
  end
end
