require 'spec_helper'
require_relative '../lib/rules'

describe Rules do
  describe 'game_over?' do
    it 'returns true if there is a winning board' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(6)
      board.mark(7)
      board.mark(8)

      rules.game_over?
      expect(rules.game_over?).to eq(true)
    end
  end

  describe 'game_over?' do
    it 'returns true if there is a full board' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(0)
      board.mark(1)
      board.mark(2)
      board.mark(3)
      board.mark(4)
      board.mark(5)
      board.mark(6)
      board.mark(7)
      board.mark(8)

      rules.game_over?
      expect(rules.game_over?).to eq(true)
    end
  end

  describe 'game_over?' do
    it 'returns false if there is not a full board or a winning board' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(0)
      board.mark(1, 'O')
      board.mark(2)
      board.mark(7, 'O')
      board.mark(8)

      rules.game_over?
      expect(rules.game_over?).to eq(false)
    end
  end
end
