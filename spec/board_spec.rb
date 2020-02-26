require 'spec_helper'
require_relative '../lib/board'

describe Board do
  describe 'board_string' do
    it 'will print a blank board when the board array contains only empty strings' do

      board = Board.new

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect(board.board_string).to eq(expected_output)
    end
  end
  it 'will print a board with an X in the center position' do
    board = Board.new

    board.mark_board(4)

    expected_output  = "   |   |   \n"
    expected_output += "-----------\n"
    expected_output += "   | X |   \n"
    expected_output += "-----------\n"
    expected_output += "   |   |   \n"
    expect(board.board_string).to eq(expected_output)
  end

  it 'will print a board with an X in the corner position' do
    board = Board.new

    board.mark_board(0, 'O')

    expected_output  = " O |   |   \n"
    expected_output += "-----------\n"
    expected_output += "   |   |   \n"
    expected_output += "-----------\n"
    expected_output += "   |   |   \n"
    expect(board.board_string).to eq(expected_output)
  end

  it 'will print a board with O winning across the top row' do
    board = Board.new

    board.mark_board(0, 'O')
    board.mark_board(1, 'O')
    board.mark_board(2, 'O')

    expected_output  = " O | O | O \n"
    expected_output += "-----------\n"
    expected_output += "   |   |   \n"
    expected_output += "-----------\n"
    expected_output += "   |   |   \n"
    expect(board.board_string).to eq(expected_output)
  end

  it 'will print a board with X winning across the bottom row' do
    board = Board.new

    board.mark_board(6)
    board.mark_board(7)
    board.mark_board(8)

    expected_output  = "   |   |   \n"
    expected_output += "-----------\n"
    expected_output += "   |   |   \n"
    expected_output += "-----------\n"
    expected_output += " X | X | X \n"
    expect(board.board_string).to eq(expected_output)
  end

  it 'will print a board with X winning on the left to right upwards diagonal' do
    board = Board.new

    board.mark_board(2)
    board.mark_board(4)
    board.mark_board(6)

    expected_output  = "   |   | X \n"
    expected_output += "-----------\n"
    expected_output += "   | X |   \n"
    expected_output += "-----------\n"
    expected_output += " X |   |   \n"
    expect(board.board_string).to eq(expected_output)
  end

  it 'will print a board with O winning on the right to left downwards diagonal' do
    board = Board.new

    board.mark_board(0, 'O')
    board.mark_board(4, 'O')
    board.mark_board(8, 'O')

    expected_output  = " O |   |   \n"
    expected_output += "-----------\n"
    expected_output += "   | O |   \n"
    expected_output += "-----------\n"
    expected_output += "   |   | O \n"
    expect(board.board_string).to eq(expected_output)
  end

  it 'will print a full board with arbitrary X and O values' do

    board = Board.new

    board.mark_board(0, 'O')
    board.mark_board(1)
    board.mark_board(2, 'O')
    board.mark_board(3)
    board.mark_board(4, 'O')
    board.mark_board(5)
    board.mark_board(6)
    board.mark_board(7)
    board.mark_board(8, 'O')

    expected_output  = " O | X | O \n"
    expected_output += "-----------\n"
    expected_output += " X | O | X \n"
    expected_output += "-----------\n"
    expected_output += " X | X | O \n"
    expect(board.board_string).to eq(expected_output)

    board.mark_board(0)
    board.mark_board(1)
    board.mark_board(2, 'O')
    board.mark_board(3)
    board.mark_board(4, 'O')
    board.mark_board(5)
    board.mark_board(6)
    board.mark_board(7, 'O')
    board.mark_board(8, 'O')

    expected_output  = " X | X | O \n"
    expected_output += "-----------\n"
    expected_output += " X | O | X \n"
    expected_output += "-----------\n"
    expected_output += " X | O | O \n"
    expect(board.board_string).to eq(expected_output)
  end

  it 'will print a full board with X values' do
    board = Board.new

    board.mark_board(0)
    board.mark_board(1)
    board.mark_board(2)
    board.mark_board(3)
    board.mark_board(4)
    board.mark_board(5)
    board.mark_board(6)
    board.mark_board(7)
    board.mark_board(8)

    expected_output  = " X | X | X \n"
    expected_output += "-----------\n"
    expected_output += " X | X | X \n"
    expected_output += "-----------\n"
    expected_output += " X | X | X \n"
    expect(board.board_string).to eq(expected_output)
  end

  it 'will print a full board with O values' do
    board = Board.new

    board.mark_board(0, 'O')
    board.mark_board(1, 'O')
    board.mark_board(2, 'O')
    board.mark_board(3, 'O')
    board.mark_board(4, 'O')
    board.mark_board(5, 'O')
    board.mark_board(6, 'O')
    board.mark_board(7, 'O')
    board.mark_board(8, 'O')

    expected_output  = " O | O | O \n"
    expected_output += "-----------\n"
    expected_output += " O | O | O \n"
    expected_output += "-----------\n"
    expected_output += " O | O | O \n"
    expect(board.board_string).to eq(expected_output)
  end
end

describe '#position_taken?' do
  it 'will return false when an index of 4 is entered' do
    board = Board.new

    board.mark_board(6)
    board.mark_board(7, 'O')
    board.mark_board(8)

    expect(board.position_taken?(4)).to eq(false)
  end

  it 'will return true when an index of 8 is entered' do

    board = Board.new

    board.mark_board(6)
    board.mark_board(7, 'O')
    board.mark_board(8)

    expect(board.position_taken?(8)).to eq(true)
  end

  describe '#mark_board' do
    it 'will mark the board with an X at 4th index' do
      board = Board.new

      board.mark_board(4)

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   | X |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect(board.board_string).to eq(expected_output)
    end

    it 'will mark the board with an O at 6th index' do
      board = Board.new

      board.mark_board(6, 'O')

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += " O |   |   \n"
      expect(board.board_string).to eq(expected_output)
    end
  end
end
