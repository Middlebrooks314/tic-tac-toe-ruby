require 'spec_helper'
require_relative '../lib/game'

describe Game, type: 'class' do
  it('is valid with valid attributes') do
    expect { Game }.not_to raise_error(NameError)
  end

  describe '#display_board' do
    it 'prints a blank board when the board array contains only empty strings' do
      board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

      game = Game.new

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {game.display_board(board)}.to output(expected_output).to_stdout
    end

    it 'prints a board with an X in the center position' do
      board = [' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' ']

      game = Game.new

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   | X |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {game.display_board(board)}.to output(expected_output).to_stdout
    end

    it 'prints a board with an O in the corner position' do
      board = ['O', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

      game = Game.new

      expected_output  = " O |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {game.display_board(board)}.to output(expected_output).to_stdout
    end

    it 'prints a board with O winning across the top row' do
      board = ['O', 'O', 'O', ' ', ' ', ' ', ' ', ' ', ' ']

      game = Game.new

      expected_output  = " O | O | O \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect {game.display_board(board)}.to output(expected_output).to_stdout
    end

    it 'prints a board with X winning across the bottom row' do
      board = [' ', ' ', ' ', ' ', ' ', ' ', 'X', 'X', 'X']

      game = Game.new

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += " X | X | X \n"
      expect {game.display_board(board)}.to output(expected_output).to_stdout
    end

    it 'prints a board with O winning on the right to left upwards diagonal' do
      board = [' ', ' ', 'X', ' ', 'X', ' ', 'X', ' ', ' ']

      game = Game.new

      expected_output  = "   |   | X \n"
      expected_output += "-----------\n"
      expected_output += "   | X |   \n"
      expected_output += "-----------\n"
      expected_output += " X |   |   \n"
      expect {game.display_board(board)}.to output(expected_output).to_stdout
    end

    it 'prints a board with O winning on the right to left downwards diagonal' do
      board = ['O', ' ', ' ', ' ', 'O', ' ', ' ', ' ', 'O']

      game = Game.new

      expected_output  = " O |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   | O |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   | O \n"
      expect {game.display_board(board)}.to output(expected_output).to_stdout
    end

    it 'prints a full board with arbitrary X and O values' do
      board = ['O', 'X', 'O', 'X', 'O', 'X', 'X', 'X', 'O']

      game = Game.new

      expected_output  = " O | X | O \n"
      expected_output += "-----------\n"
      expected_output += " X | O | X \n"
      expected_output += "-----------\n"
      expected_output += " X | X | O \n"
      expect {game.display_board(board)}.to output(expected_output).to_stdout

      board = ['X', 'X', 'O', 'X', 'O', 'X', 'X', 'O', 'O']

      game = Game.new

      expected_output  = " X | X | O \n"
      expected_output += "-----------\n"
      expected_output += " X | O | X \n"
      expected_output += "-----------\n"
      expected_output += " X | O | O \n"
      expect {game.display_board(board)}.to output(expected_output).to_stdout
    end

    it 'prints a full board with X values' do
      board = ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']

      game = Game.new

      expected_output  = " X | X | X \n"
      expected_output += "-----------\n"
      expected_output += " X | X | X \n"
      expected_output += "-----------\n"
      expected_output += " X | X | X \n"
      expect {game.display_board(board)}.to output(expected_output).to_stdout
    end

    it 'prints a full board with O values' do
      board = ['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O']

      game = Game.new

      expected_output  = " O | O | O \n"
      expected_output += "-----------\n"
      expected_output += " O | O | O \n"
      expected_output += "-----------\n"
      expected_output += " O | O | O \n"
      expect {game.display_board(board)}.to output(expected_output).to_stdout
    end
  end
end
