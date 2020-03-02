require 'spec_helper'
require_relative '../lib/board'

describe Board do
  describe 'display' do
    it 'returns a blank board when the board array contains only empty strings' do

      board = Board.new

      expected_output  = "   |   |  \n"
      expected_output += "-----------\n"
      expected_output += "   |   |  \n"
      expected_output += "-----------\n"
      expected_output += "   |   |  \n"
      expect(board.display).to eq(expected_output)
    end
  end
  it 'returns a board with an X in the center position' do
    board = Board.new

    board.mark(4)

    expected_output  = "   |   |  \n"
    expected_output += "-----------\n"
    expected_output += "   | X |  \n"
    expected_output += "-----------\n"
    expected_output += "   |   |  \n"
    expect(board.display).to eq(expected_output)
  end

  it 'returns a board with an O in the upper right corner position' do
    board = Board.new

    board.mark(0, 'O')

    expected_output  = " O |   |  \n"
    expected_output += "-----------\n"
    expected_output += "   |   |  \n"
    expected_output += "-----------\n"
    expected_output += "   |   |  \n"
    expect(board.display).to eq(expected_output)
  end

  it 'returns a board with O in across the top row in indexes 0-2' do
    board = Board.new

    board.mark(0, 'O')
    board.mark(1, 'O')
    board.mark(2, 'O')

    expected_output  = " O | O | O\n"
    expected_output += "-----------\n"
    expected_output += "   |   |  \n"
    expected_output += "-----------\n"
    expected_output += "   |   |  \n"
    expect(board.display).to eq(expected_output)
  end

  it 'returns a board with X across the bottom row in indexes 6-8' do
    board = Board.new

    board.mark(6)
    board.mark(7)
    board.mark(8)

    expected_output  = "   |   |  \n"
    expected_output += "-----------\n"
    expected_output += "   |   |  \n"
    expected_output += "-----------\n"
    expected_output += " X | X | X\n"
    expect(board.display).to eq(expected_output)
  end

  it 'returns a board with X on the left to right upwards diagonal in indexes 2, 4, 6' do
    board = Board.new

    board.mark(2)
    board.mark(4)
    board.mark(6)

    expected_output  = "   |   | X\n"
    expected_output += "-----------\n"
    expected_output += "   | X |  \n"
    expected_output += "-----------\n"
    expected_output += " X |   |  \n"
    expect(board.display).to eq(expected_output)
  end

  it 'returns a board with O in the right to left downwards diagonal in indexes 0, 4, 8' do
    board = Board.new

    board.mark(0, 'O')
    board.mark(4, 'O')
    board.mark(8, 'O')

    expected_output  = " O |   |  \n"
    expected_output += "-----------\n"
    expected_output += "   | O |  \n"
    expected_output += "-----------\n"
    expected_output += "   |   | O\n"
    expect(board.display).to eq(expected_output)
  end

  it 'returns a full board with arbitrary X and O values' do

    board = Board.new

    board.mark(0, 'O')
    board.mark(1)
    board.mark(2, 'O')
    board.mark(3)
    board.mark(4, 'O')
    board.mark(5)
    board.mark(6)
    board.mark(7)
    board.mark(8, 'O')

    expected_output  = " O | X | O\n"
    expected_output += "-----------\n"
    expected_output += " X | O | X\n"
    expected_output += "-----------\n"
    expected_output += " X | X | O\n"
    expect(board.display).to eq(expected_output)
  end

  it 'returns a full board with arbitrary character values' do

    board = Board.new
    board.mark(0, 'M')
    board.mark(1, '$')
    board.mark(2, 'O')
    board.mark(3, '#')
    board.mark(4, 'O')
    board.mark(5)
    board.mark(6)
    board.mark(7, 'V')
    board.mark(8, 'P')

    expected_output  = " M | $ | O\n"
    expected_output += "-----------\n"
    expected_output += " # | O | X\n"
    expected_output += "-----------\n"
    expected_output += " X | V | P\n"
    expect(board.display).to eq(expected_output)
  end

  it 'returns a full board with X values' do
    board = Board.new

    board.mark(0)
    board.mark(1)
    board.mark(2)
    board.mark(3)
    board.mark(4)
    board.mark(5)
    board.mark(6)
    board.mark(7)
    board.mark(8)

    expected_output  = " X | X | X\n"
    expected_output += "-----------\n"
    expected_output += " X | X | X\n"
    expected_output += "-----------\n"
    expected_output += " X | X | X\n"
    expect(board.display).to eq(expected_output)
  end

  it 'returns a full board with O values' do
    board = Board.new

    board.mark(0, 'O')
    board.mark(1, 'O')
    board.mark(2, 'O')
    board.mark(3, 'O')
    board.mark(4, 'O')
    board.mark(5, 'O')
    board.mark(6, 'O')
    board.mark(7, 'O')
    board.mark(8, 'O')

    expected_output  = " O | O | O\n"
    expected_output += "-----------\n"
    expected_output += " O | O | O\n"
    expected_output += "-----------\n"
    expected_output += " O | O | O\n"
    expect(board.display).to eq(expected_output)
  end
end

describe '#position_taken?' do
  it 'returns false when an index that is not taken is entered' do
    board = Board.new

    board.mark(6)
    board.mark(7, 'O')
    board.mark(8)

    expect(board.position_taken?(4)).to eq(false)
  end

  it 'returns true when an index that is entered is not an empty string' do
    board = Board.new

    board.mark(6)
    board.mark(7, 'O')
    board.mark(8)

    expect(board.position_taken?(8)).to eq(true)
  end

  describe 'full?' do
    it 'returns true when every index in squares array is full with Xs' do
      board = Board.new

      board.squares.each.with_index do |_string, index|
        board.mark(index)
      end

      expect(board.full?).to eq(true)
    end
  end

  describe 'full?' do
    it 'returns true when every index in squares array is full with Os' do
      board = Board.new

      board.squares.each.with_index do |_string, index|
        board.mark(index, 'O')
      end

      expect(board.full?).to eq(true)
    end
  end

  describe 'full?' do
    it 'returns false when there is an available index in the squares array' do
      board = Board.new

      board.mark(0, 'O')
      board.mark(2, 'O')
      board.mark(3)
      board.mark(4, 'O')
      board.mark(6)
      board.mark(7)
      board.mark(8, 'O')

      expect(board.full?).to eq(false)
    end
  end
end
