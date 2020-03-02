require 'spec_helper'
require_relative '../lib/rules'

describe Rules do
  describe 'game_over?' do
    it 'returns true if there is a horizontal winner' do
      board = Board.new

      board.mark(0, 'O')
      board.mark(1, 'O')
      board.mark(2, 'O')
      board.mark(4)
      board.mark(5)
      board.mark(7)
      board.mark(8)

      # Rules.game_over?(board)
      expect(Rules.game_over?(board)).to eq(true)
    end
  end

  describe 'game_over?' do
    it 'returns true if there is a full board' do
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

      expect(Rules.game_over?(board)).to eq(true)
    end
  end

  describe 'game_over?' do
    it 'returns false if there is not a full board or a winning board' do
      board = Board.new

      board.mark(0)
      board.mark(1, 'O')
      board.mark(2)
      board.mark(7, 'O')
      board.mark(8)

      expect(Rules.game_over?(board)).to eq(false)
    end
  end

  describe 'winning_combination?' do
    it 'returns true with an X winning combination' do
      board = Board.new

      board.mark(2)
      board.mark(4)
      board.mark(6)

      expect(Rules.winning_combination?(board)).to eq(true)
    end
  end

  describe 'winning_combination?' do
    it 'returns true with an O winning combination' do
      board = Board.new

      board.mark(1, 'O')
      board.mark(4, 'O')
      board.mark(7, 'O')

      expect(Rules.winning_combination?(board)).to eq(true)
    end
  end

  describe 'winning_combination?' do
    it 'returns false when there is no winning sequence of characters' do
      board = Board.new

      board.mark(1, 'O')
      board.mark(6, 'O')
      board.mark(7, 'O')
      board.mark(8)

      expect(Rules.winning_combination?(board)).to eq(false)
    end
  end
end
