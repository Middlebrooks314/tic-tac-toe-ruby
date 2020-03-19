require 'spec_helper'
require_relative '../lib/rules'

describe Rules do
  describe 'game_over?' do
    it 'returns true if there is a winner' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(0, 'O')
      board.mark(1, 'O')
      board.mark(2, 'O')
      board.mark(4)
      board.mark(5)
      board.mark(7)
      board.mark(8)

      expect(rules.game_over?).to eq(true)
    end

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

      expect(rules.game_over?).to eq(true)
    end

    it 'returns false if there is not a full board or a winner' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(0)
      board.mark(1, 'O')
      board.mark(2)
      board.mark(7, 'O')
      board.mark(8)

      expect(rules.game_over?).to eq(false)
    end
  end

  describe 'winning_combination?' do
    it 'returns true when there is an X diagonal winner' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(2)
      board.mark(3, 'O')
      board.mark(4)
      board.mark(5, 'O')
      board.mark(6)

      expect(rules.winning_combination?).to eq(true)
    end

    it 'returns true when there is an O diagonal winner' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(0, 'O')
      board.mark(1)
      board.mark(3)
      board.mark(4, 'O')
      board.mark(5)
      board.mark(8, 'O')

      expect(rules.winning_combination?).to eq(true)
    end

    it 'returns true with a vertical O winning combination' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(0)
      board.mark(1, 'O')
      board.mark(2)
      board.mark(4, 'O')
      board.mark(6)
      board.mark(7, 'O')

      expect(rules.winning_combination?).to eq(true)
    end
  end

  describe 'winning_combination?' do
    it 'returns true with a vertical X winning combination' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(1, 'O')
      board.mark(2)
      board.mark(5)
      board.mark(6)
      board.mark(7, 'O')
      board.mark(8)

      expect(rules.winning_combination?).to eq(true)
    end

    it 'returns true with a horizontal O winning combination' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(0, 'O')
      board.mark(1, 'O')
      board.mark(2, 'O')
      board.mark(4)
      board.mark(5)
      board.mark(7)

      expect(rules.winning_combination?).to eq(true)
    end

    it 'returns true with a horizontal X winning combination' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(2, 'O')
      board.mark(3, 'O')
      board.mark(4)
      board.mark(5, 'O')
      board.mark(6)
      board.mark(7)
      board.mark(8)

      expect(rules.winning_combination?).to eq(true)
    end

    it 'returns true when there a diagonal and horizontal X winning combo' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(0, 'O')
      board.mark(1, 'O')
      board.mark(2)
      board.mark(3, 'O')
      board.mark(4)
      board.mark(5, 'O')
      board.mark(6)
      board.mark(7)
      board.mark(8)

      expect(rules.winning_combination?).to eq(true)
    end

    it 'returns false when there is no winning sequence of characters' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(1, 'O')
      board.mark(6, 'O')
      board.mark(7, 'O')
      board.mark(8)

      expect(rules.winning_combination?).to eq(false)
    end
  end

  describe 'check_for_draw?' do
    it 'returns true when there is a full board without a winning combination' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(0, 'O')
      board.mark(1)
      board.mark(2, 'O')
      board.mark(3, 'O')
      board.mark(4)
      board.mark(5)
      board.mark(6)
      board.mark(7, 'O')
      board.mark(8, 'O')

      expect(rules.check_for_draw?).to eq(true)

    end

    it 'returns false when there is a full board with a winning combination' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(0, 'O')
      board.mark(1)
      board.mark(2, 'O')
      board.mark(3)
      board.mark(4, 'O')
      board.mark(5)
      board.mark(6)
      board.mark(7)
      board.mark(8, 'O')

      expect(rules.check_for_draw?).to eq(false)
    end

    it 'returns false when there is a winning combination on a board that is not full' do
      board = Board.new
      rules = Rules.new(board)

      board.mark(0, 'O')
      board.mark(2)
      board.mark(4)
      board.mark(6)
      board.mark(8, 'O')

      expect(rules.check_for_draw?).to eq(false)
    end
  end
end
