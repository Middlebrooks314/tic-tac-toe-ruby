require 'spec_helper'
require_relative './fake_console'
require 'require_all'
require_all 'lib'

describe Game do
  before(:each) do
    @board = Board.new
    @rules = Rules.new(@board)
    @console = FakeConsole.new
    @display = Display.new(@console, @board)
    @player_one = HumanPlayer.new('X', @board, @display)
    @player_two = HumanPlayer.new('O', @board, @display)
    @game = Game.new(@display, @rules, @player_one, @player_two)
  end

  describe 'turn' do
    it 'marks a board appropriately with an X in the center' do
      @console.stub_get_input(['5'])

      @game.turn

      expected_output  = "   |   |  \n"
      expected_output += "-----------\n"
      expected_output += "   | X |  \n"
      expected_output += "-----------\n"
      expected_output += "   |   |  \n"
      expect(@console.print_message(@console.printed_string)).to eq(expected_output)
    end

    it 'marks a board appropriately with an X in the upper right corner' do
      @console.stub_get_input(['3'])

      @game.turn

      expected_output  = "   |   | X\n"
      expected_output += "-----------\n"
      expected_output += "   |   |  \n"
      expected_output += "-----------\n"
      expected_output += "   |   |  \n"
      expect(@console.print_message(@console.printed_string)).to eq(expected_output)
    end
  end

  describe 'play' do
    it 'ends the game after X has a winning horizontal combination' do
      @board.mark(0)
      @board.mark(1)
      @console.stub_get_input(['3'])
      @game.play

      expect(@rules.game_over?).to eq true
    end
  end

  it 'ends the game after X has a winning diagonal combination' do
    @console.stub_get_input(['3', '4', '5', '6', '7'])
    @game.play

    expect(@rules.game_over?).to eq true
  end

  it 'ends the game after X has a winning diagonal combination on a full board' do
    @console.stub_get_input(['3', '6', '9', '8', '7', '1', '4', '2', '5'])
    @game.play

    expect(@rules.game_over?).to eq true
  end

  it 'ends the game after O has a winning horizontal combination' do
    @console.stub_get_input(['1', '4', '7', '5', '8', '6'])
    @game.play

    expect(@rules.game_over?).to eq true
  end

  it 'ends the game after O has a winning diagonal combination' do
    @console.stub_get_input(['3', '1', '6', '5', '7', '9'])
    @game.play

    expect(@rules.game_over?).to eq true
  end

  it 'ends the game after O has a winning diagonal combination on a full board' do
    @console.stub_get_input(['2', '1', '4', '5', '3', '7', '6', '8', '9'])
    @game.play

    expect(@rules.game_over?).to eq true
  end

  it 'ends the game after the board is full with no winning combinations' do
    @console.stub_get_input(['1', '2', '3', '4', '5', '8', '6', '9', '7'])
    @game.play

    expect(@rules.game_over?).to eq true
  end

  it 'tells the user that the game is over when O has a winning diagonal combination' do
    @console.stub_get_input(['3', '1', '6', '5', '7', '9'])
    @game.play

    expect(@console.print_message(@console.printed_string)).to eq('Congratulations O!')
  end

  it 'tells the user that the game is over when X has a winning diagonal combination' do
    @console.stub_get_input(['1', '2', '3', '4', '5', '8', '6', '9', '7'])
    @game.play

    expect(@console.print_message(@console.printed_string)).to eq('Congratulations X!')
  end

  it 'ends the game after X has a winning diagonal combination' do

    @board.mark(0)
    @console.stub_get_input(['3', '4', '5', '6', '7'])
    @game.play

    expect(@rules.game_over?).to eq true
  end

  it 'ends the game after X has a winning diagonal combination on a full board' do
    @console.stub_get_input(['3', '6', '9', '8', '7', '1', '4', '2', '5'])
    @game.play

    expect(@rules.game_over?).to eq true
  end

  it 'ends the game after O has a winning horizontal combination' do
    @console.stub_get_input(['1', '4', '7', '5', '8', '6'])
    @game.play

    expect(@rules.game_over?).to eq true
  end

  it 'ends the game after O has a winning diagonal combination' do
    @console.stub_get_input(['3', '1', '6', '5', '7', '9'])
    @game.play

    expect(@rules.game_over?).to eq true
  end

  it 'ends the game after O has a winning diagonal combination on a full board' do
    @console.stub_get_input(['2', '1', '4', '5', '3', '7', '6', '8', '9'])
    @game.play

    expect(@rules.game_over?).to eq true
  end

  it 'ends the game after the board is full with no winning combinations' do
    @console.stub_get_input(['1', '2', '3', '4', '5', '7', '6', '9', '8'])
    @game.play

    expect(@rules.game_over?).to eq true
    expect(@console.printed_string).to eq('Draw!')
  end

  it 'tells the user that the game is over when O has a winning diagonal combination' do
    @console.stub_get_input(['3', '1', '6', '5', '7', '9'])
    @game.play

    expect(@console.print_message(@console.printed_string)).to eq('Congratulations O!')
  end

  it 'tells the user that the game is over when X has a winning diagonal combination' do
    @console.stub_get_input(['1', '2', '3', '4', '5', '8', '6', '9', '7'])
    @game.play

    expect(@console.print_message(@console.printed_string)).to eq('Congratulations X!')
  end

  describe 'game_over_message' do
    it 'prints Game Over message to the user when the game is completed' do
      @game.game_over_message

      expect(@console.printed_string).to eq('Draw!')
    end
  end

  describe 'turn' do
    it 'asks the current player for their move' do
      @current_player = @player_one
      @console.stub_get_input([4])
      @display.alert_current_player(@current_player)

      expect(@console.printed_string).to eq('It is X\'s turn')
    end

    it 'marks the board with the user\'s input when they choose a move between 1-9 and is not already marked' do
      @board.mark(3)
      @board.mark(2, 'O')
      @console.stub_get_input([5])
      @player_one.move

      expected_output  = "   |   | O\n"
      expected_output += "-----------\n"
      expected_output += " X | X |  \n"
      expected_output += "-----------\n"
      expected_output += "   |   |  \n"

      expect(@board.display).to eq(expected_output)
    end
  end

  describe 'game_over_message' do
    it 'will print draw to the console when the board is full and there is no winner' do
      @console.stub_get_input([1, 2, 3, 4, 6, 9, 7, 5, 8])
      @game.play

      expect(@console.printed_string).to eq('Draw!')
    end

    it 'prints Congratulations message to X when they have a winning combination' do
      @console.stub_get_input([1, 2, 4, 3, 7])
      @game.play

      expect(@console.printed_string).to eq('Congratulations X!')
    end
  end
end
