require 'spec_helper'
require_relative '../lib/game'

describe Game, type: 'class' do
  it('is valid with valid attributes') do

    expect { Game }.not_to raise_error(NameError)
  end

  describe 'initialize' do
    it 'will assign an instance variable @board to an array with 9 empty strings' do
      game = Game.new

      expect(game.instance_variable_get(:@board)).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  describe '#display_board' do
    it 'will print a blank board when the board array contains only empty strings' do

      game = Game.new

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a board with an X in the center position' do

      game = Game.new
      game.instance_variable_set(:@board, [' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' '])

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   | X |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a board with an O in the corner position' do

      game = Game.new
      game.instance_variable_set(:@board, ['O', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])

      expected_output  = " O |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a board with O winning across the top row' do

      game = Game.new
      game.instance_variable_set(:@board, ['O', 'O', 'O', ' ', ' ', ' ', ' ', ' ', ' '])

      expected_output  = " O | O | O \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a board with X winning across the bottom row' do

      game = Game.new
      game.instance_variable_set(:@board, [' ', ' ', ' ', ' ', ' ', ' ', 'X', 'X', 'X'])

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += " X | X | X \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a board with X winning on the right to left upwards diagonal' do

      game = Game.new
      game.instance_variable_set(:@board, [' ', ' ', 'X', ' ', 'X', ' ', 'X', ' ', ' '])

      expected_output  = "   |   | X \n"
      expected_output += "-----------\n"
      expected_output += "   | X |   \n"
      expected_output += "-----------\n"
      expected_output += " X |   |   \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a board with O winning on the right to left downwards diagonal' do

      game = Game.new
      game.instance_variable_set(:@board, ['O', ' ', ' ', ' ', 'O', ' ', ' ', ' ', 'O'])

      expected_output  = " O |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   | O |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   | O \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a full board with arbitrary X and O values' do

      game = Game.new
      game.instance_variable_set(:@board, ['O', 'X', 'O', 'X', 'O', 'X', 'X', 'X', 'O'])

      expected_output  = " O | X | O \n"
      expected_output += "-----------\n"
      expected_output += " X | O | X \n"
      expected_output += "-----------\n"
      expected_output += " X | X | O \n"
      expect {game.display_board}.to output(expected_output).to_stdout

      game = Game.new
      game.instance_variable_set(:@board, ['X', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'O'])

      expected_output  = " X | X | O \n"
      expected_output += "-----------\n"
      expected_output += " X | O | X \n"
      expected_output += "-----------\n"
      expected_output += " X | O | O \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a full board with X values' do
      game = Game.new
      game.instance_variable_set(:@board, ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'])

      expected_output  = " X | X | X \n"
      expected_output += "-----------\n"
      expected_output += " X | X | X \n"
      expected_output += "-----------\n"
      expected_output += " X | X | X \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a full board with O values' do
      game = Game.new
      game.instance_variable_set(:@board, ['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O'])

      expected_output  = " O | O | O \n"
      expected_output += "-----------\n"
      expected_output += " O | O | O \n"
      expected_output += "-----------\n"
      expected_output += " O | O | O \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end
  end

  describe '#mark_board' do
    it 'will mark the board with an X at the the board[2]' do
      game = Game.new
      game.mark_board(2, 'X')

      board = game.instance_variable_get(:@board)

      expect(board).to eq([' ', ' ', 'X', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  describe '#input_to_index' do
    it 'will return 4 as the array index when a user inputs 5' do
      game = Game.new

      expect(game.input_to_index(5)).to eq(4)
    end

    it 'will return 0 as the array index when a user inputs 1' do
      game = Game.new

      expect(game.input_to_index(1)).to eq(0)
    end
  end

  describe '#position_taken?' do
    it 'will return false when an index of 4 is entered' do
      game = Game.new
      game.instance_variable_set(:@board, [' ', ' ', ' ', ' ', ' ', ' ', 'X', 'O', 'X'])

      expect(game.position_taken?(4)).to eq(false)
    end

    it 'will return true when an index of 8 is entered' do
      game = Game.new
      game.instance_variable_set(:@board, [' ', ' ', ' ', ' ', ' ', ' ', 'X', 'O', 'X'])

      expect(game.position_taken?(8)).to eq(true)
    end
  end

  describe '#mark_board' do
    it 'will mark the board with an X at 4th index' do
      game = Game.new

      game.mark_board(4)

      board = game.instance_variable_get(:@board)

      expect(board).to eq([' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' '])
    end

    it 'will mark the board with an O at 6th index' do
      game = Game.new
      game.instance_variable_set(:@board, [' ', 'X', ' ', ' ', ' ', ' ', 'X', ' ', 'X'])

      game.mark_board(4, 'O')

      board = game.instance_variable_get(:@board)

      expect(board).to eq([' ', 'X', ' ', ' ', 'O', ' ', 'X', ' ', 'X'])
    end
  end

  # describe '#move' do

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
  #     expect(game).to receive(:display_board)

  #     game.move

  #     board = game.instance_variable_get(:@board)
  #     expect(board).to eq(['X', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
  #   end
  # end
end
