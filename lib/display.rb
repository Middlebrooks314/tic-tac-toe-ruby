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

  def setup_mark_message(player_number)
    @console.print_message("Player #{player_number}, please enter a single characters to use as your game piece")
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

  def invalid_player_choice
    @console.print_message('That is not a valid choice. Please try again')
  end

  def player_choice_prompt(player_number)
    @console.print_message("Please choose a player type for the #{player_number} player")
  end

  def player_choice
    @console.print_message('1: Human Player')
    @console.print_message('2: Computer Player')
  end

  def computer_move(move)
    @console.print_message(move)
  end

  def computer_thinking
    @console.print_message('The computer is contemplating 🤔.....')
  end
end
