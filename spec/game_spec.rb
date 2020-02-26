require 'spec_helper'
require_relative '../lib/game'

class FakeConsole
  attr_reader :printed_string
  attr_reader :input

  def retrieve_user_input(input)
    @input = input
  end

  def print_message(string)
    @printed_string = string
  end
end

describe Game do
  describe 'welcome' do
    it 'prints a string to welcome user to the game' do
      console = FakeConsole.new
      board = Board.new
      game = Game.new(board, console)

      game.welcome

      expect(console.printed_string).to eq('Welcome to Tic Tac Toe')
    end
  end

  describe 'play' do
    it 'marks a board appropriately with an X in the center' do
      board = Board.new
      console = FakeConsole.new
      console.stub_get_input('5')

      game = Game.new(board, console)

      game.play

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   | X |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect(board.board_string).to eq(expected_output)
    end

    # it 'marks a board appropriately with an O in the upper right corner' do
    #   board = Board.new
    #   console = FakeConsole.new
    #   game = Game.new(board, console)

    #   game.play

    #   expected_output  = "   |   | O \n"
    #   expected_output += "-----------\n"
    #   expected_output += "   |   |   \n"
    #   expected_output += "-----------\n"
    #   expected_output += "   |   |   \n"
    #   expect(board.board_string).to eq(expected_output)
    # end
  end
  # describe '#input_to_index' do
  #   it 'will return 4 as the array index when a user inputs 5' do
  #     game = Game.new

  #     expect(game.input_to_index(5)).to eq(4)
  #   end

  #   it 'will return 0 as the array index when a user inputs 1' do
  #     game = Game.new

  #     expect(game.input_to_index(1)).to eq(0)
  #   end
  # end

  # describe '#play' do

  #   game = Game.new

  #   it 'receives user input using the gets method' do
  #     allow($stdout).to receive(:puts)
  #     expect(game).to receive(:gets).and_return('1')

  #     game.move
  #   end

  #   it 'calls #input_to_index and #position_taken?' do
  #     allow($stdout).to receive(:puts)
  #     expect(game).to receive(:gets).and_return('1')
  #     expect(game).to receive(:input_to_index).and_return(0)
  #     expect(game).to receive(:position_taken?).and_return(false)

  #     game.move
  #   end

  #   it 'takes a user input of 4 and displays a board with an X in the 0th index' do
  #     allow($stdout).to receive(:puts)
  #     expect(game).to receive(:gets).and_return('1')
  #     expect(game).to receive(:input_to_index).and_return(0)
  #     expect(game).to receive(:display_board)

  #     board = game.instance_variable_get(:@board)
  #     expect(board).to eq(['X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
  #   game.move
    # end
  # end
end
