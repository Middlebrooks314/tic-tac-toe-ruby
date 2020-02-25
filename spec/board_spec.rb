require 'spec_helper'
require_relative '../lib/board'

describe Board do
  describe 'initialize' do
    it 'will assign an instance variable @board to an array with 9 empty strings' do
      board = Board.new

      expect(board.instance_variable_get(:@board)).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  describe '#display_board' do
    it 'will print a blank board when the board array contains only empty strings' do

      board = Board.new

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {board.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a board with an X in the center position' do

      board = Board.new
      board.instance_variable_set(:@board, [' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' '])

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   | X |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {board.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a board with an O in the corner position' do

      board = Board.new
      board.instance_variable_set(:@board, ['O', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])

      expected_output  = " O |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {board.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a board with O winning across the top row' do

      board = Board.new
      board.instance_variable_set(:@board, ['O', 'O', 'O', ' ', ' ', ' ', ' ', ' ', ' '])

      expected_output  = " O | O | O \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {board.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a board with X winning across the bottom row' do

      board = Board.new
      board.instance_variable_set(:@board, [' ', ' ', ' ', ' ', ' ', ' ', 'X', 'X', 'X'])

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += " X | X | X \n"
      expect {board.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a board with X winning on the right to left upwards diagonal' do

      board = Board.new
      board.instance_variable_set(:@board, [' ', ' ', 'X', ' ', 'X', ' ', 'X', ' ', ' '])

      expected_output  = "   |   | X \n"
      expected_output += "-----------\n"
      expected_output += "   | X |   \n"
      expected_output += "-----------\n"
      expected_output += " X |   |   \n"
      expect {board.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a board with O winning on the right to left downwards diagonal' do

      board = Board.new
      board.instance_variable_set(:@board, ['O', ' ', ' ', ' ', 'O', ' ', ' ', ' ', 'O'])

      expected_output  = " O |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   | O |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   | O \n"
      expect {board.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a full board with arbitrary X and O values' do

      board = Board.new
      board.instance_variable_set(:@board, ['O', 'X', 'O', 'X', 'O', 'X', 'X', 'X', 'O'])

      expected_output  = " O | X | O \n"
      expected_output += "-----------\n"
      expected_output += " X | O | X \n"
      expected_output += "-----------\n"
      expected_output += " X | X | O \n"
      expect {board.display_board}.to output(expected_output).to_stdout

      board = Board.new
      board.instance_variable_set(:@board, ['X', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'O'])

      expected_output  = " X | X | O \n"
      expected_output += "-----------\n"
      expected_output += " X | O | X \n"
      expected_output += "-----------\n"
      expected_output += " X | O | O \n"
      expect {board.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a full board with X values' do
      board = Board.new
      board.instance_variable_set(:@board, ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'])

      expected_output  = " X | X | X \n"
      expected_output += "-----------\n"
      expected_output += " X | X | X \n"
      expected_output += "-----------\n"
      expected_output += " X | X | X \n"
      expect {board.display_board}.to output(expected_output).to_stdout
    end

    it 'will print a full board with O values' do
      board = Board.new
      board.instance_variable_set(:@board, ['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O'])

      expected_output  = " O | O | O \n"
      expected_output += "-----------\n"
      expected_output += " O | O | O \n"
      expected_output += "-----------\n"
      expected_output += " O | O | O \n"
      expect {board.display_board}.to output(expected_output).to_stdout
    end
  end

  describe '#position_taken?' do
    it 'will return false when an index of 4 is entered' do
      board = Board.new
      board.instance_variable_set(:@board, [' ', ' ', ' ', ' ', ' ', ' ', 'X', 'O', 'X'])

      expect(board.position_taken?(4)).to eq(false)
    end

    it 'will return true when an index of 8 is entered' do
      board = Board.new
      board.instance_variable_set(:@board, [' ', ' ', ' ', ' ', ' ', ' ', 'X', 'O', 'X'])

      expect(board.position_taken?(8)).to eq(true)
    end
  end

  describe '#mark_board' do
    it 'will mark the board with an X at 4th index' do
      board = Board.new

      board.mark_board(4)

      board = board.instance_variable_get(:@board)

      expect(board).to eq([' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' '])
    end

    it 'will mark the board with an O at 6th index' do
      board = Board.new
      board.instance_variable_set(:@board, [' ', 'X', ' ', ' ', ' ', ' ', 'X', ' ', 'X'])

      board.mark_board(4, 'O')

      board = board.instance_variable_get(:@board)

      expect(board).to eq([' ', 'X', ' ', ' ', 'O', ' ', 'X', ' ', 'X'])
    end
  end
end
