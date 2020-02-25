require 'spec_helper'
require_relative '../lib/game'

class FakeConsole

  def retrieve_user_input
    '5'
  end

  def print_message(string)
  end
end

describe Game do
  describe 'play' do
    it 'marks a board appropriately' do
      board = Board.new
      console = FakeConsole.new
      game = Game.new(board, console)

      game.play

      expect(board.board_string).to eq('something goes here')
    end

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
