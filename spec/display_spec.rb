require 'require_all'
require_all 'lib'
require_relative './fake_console.rb'

describe Display do
  describe 'welcome' do
    it 'prints a string to welcome user to the game' do
      console = FakeConsole.new
      board = Board.new
      display = Display.new(console, board)
      display.welcome

      expect(console.printed_string).to eq('Welcome to Tic Tac Toe')
    end
  end

  describe 'player_choice_prompt' do
    it 'asks player 1 and 2 for the player type' do
      console = FakeConsole.new
      board = Board.new
      display = Display.new(console, board)

      display.player_choice_prompt('first')

      expect(console.printed_string).to eq('Please choose a player type for the first player')
    end
  end
  

  describe 'make_move_message' do
    it 'asks the current player for their move' do
      console = FakeConsole.new
      board = Board.new
      display = Display.new(console, board)

      display.make_move_message('X')

      expect(console.printed_string).to eq('Player X, please enter a position 1-9 that is not already marked')
    end
  end

  describe 'alert_current_player' do
    it 'alerts the the given player that it is their turn' do
      console = FakeConsole.new
      board = Board.new
      display = Display.new(console, board)
      current_player = HumanPlayer.new('X', board, display)

      display.alert_current_player(current_player)

      expect(console.printed_string).to eq("It is X\'s turn")
    end

  end

  describe 'setup_mark_message' do
    it 'asks the user to enter a mark' do
      console = FakeConsole.new
      board = Board.new
      display = Display.new(console, board)

      display.setup_mark_message(2)

      expect(console.printed_string).to eq('Player 2, please enter a single character to use as your game piece')
    end
  end

  describe 'winner_message' do
    it 'declares the winner' do
      console = FakeConsole.new
      board = Board.new
      display = Display.new(console, board)

      display.winner_message('X')

      expect(console.printed_string).to eq('Congratulations X!')
    end
  end

  describe 'draw_message' do
    it 'alerts the players of a tie game' do
      console = FakeConsole.new
      board = Board.new
      display = Display.new(console, board)

      display.draw_message

      expect(console.printed_string).to eq('Draw!')
    end
  end

  describe 'board' do
    it 'prints an empty board' do
      console = FakeConsole.new
      board = Board.new
      display = Display.new(console, board)

      display.board

      expected_output  = "   |   |  \n"
      expected_output += "-----------\n"
      expected_output += "   |   |  \n"
      expected_output += "-----------\n"
      expected_output += "   |   |  \n"

      expect(console.print_message(console.printed_string)).to eq(expected_output)
    end
  end
end
