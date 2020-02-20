require 'spec_helper'
require_relative '../lib/game'

describe Game, type: 'class' do
  it('is valid with valid attributes') do
    expect { Game }.not_to raise_error(NameError)
  end

  describe 'initialize' do
    it 'assigns an instance variable @board to an array with 9 empty strings' do
      game = Game.new
      expect(game.instance_variable_get(:@board)).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  describe '#display_board' do
    it 'prints a blank board when the board array contains only empty strings' do

      game = Game.new

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'prints a board with an X in the center position' do

      game = Game.new
      game.instance_variable_set(:@board, [' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' '])

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   | X |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'prints a board with an O in the corner position' do

      game = Game.new
      game.instance_variable_set(:@board, ['O', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])

      expected_output  = " O |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'prints a board with O winning across the top row' do

      game = Game.new
      game.instance_variable_set(:@board, ['O', 'O', 'O', ' ', ' ', ' ', ' ', ' ', ' '])

      expected_output  = " O | O | O \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'prints a board with X winning across the bottom row' do

      game = Game.new
      game.instance_variable_set(:@board, [' ', ' ', ' ', ' ', ' ', ' ', 'X', 'X', 'X'])

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += " X | X | X \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'prints a board with X winning on the right to left upwards diagonal' do

      game = Game.new
      game.instance_variable_set(:@board, [' ', ' ', 'X', ' ', 'X', ' ', 'X', ' ', ' '])

      expected_output  = "   |   | X \n"
      expected_output += "-----------\n"
      expected_output += "   | X |   \n"
      expected_output += "-----------\n"
      expected_output += " X |   |   \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'prints a board with O winning on the right to left downwards diagonal' do

      game = Game.new
      game.instance_variable_set(:@board, ['O', ' ', ' ', ' ', 'O', ' ', ' ', ' ', 'O'])

      expected_output  = " O |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   | O |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   | O \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'prints a full board with arbitrary X and O values' do

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

    it 'prints a full board with X values' do

      game = Game.new
      game.instance_variable_set(:@board, ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'])

      expected_output  = " X | X | X \n"
      expected_output += "-----------\n"
      expected_output += " X | X | X \n"
      expected_output += "-----------\n"
      expected_output += " X | X | X \n"
      expect {game.display_board}.to output(expected_output).to_stdout
    end

    it 'prints a full board with O values' do

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
    it 'receives user input' do

      game = Game.new
      game.mark_board(2, 'X')

      board = game.instance_variable_get(:@board)

      expect(board).to eq([' ', ' ', 'X', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  describe 'input_to_index' do
    it 'turns a user input of 5 into an array index of 4(n-1)' do

      game = Game.new

      expect(game.input_to_index(5)).to eq(4)
    end

    it 'turns a user input of 1 into an array index 0 (n-1)' do

      game = Game.new\

      expect(game.input_to_index(1)).to eq(0)
    end
  end
end
