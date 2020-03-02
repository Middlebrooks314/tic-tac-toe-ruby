require 'spec_helper'
require_relative '../lib/game'

class FakeConsole
  attr_reader :printed_string

  def stub_get_input(input)
    @input = input
  end

  def retrieve_user_input
    @input
  end

  def print_message(string)
    @printed_string = string
  end
end

describe Game do
  describe 'welcome' do
    it 'prints a string to welcome user to the game' do
      console = FakeConsole.new
      board = Board.new
      game = Game.new(board, console)

      game.welcome

      expect(console.printed_string).to eq('Welcome to Tic Tac Toe')
    end
  end

  describe 'play' do
    it 'marks a board appropriately with an X in the center' do
      board = Board.new
      console = FakeConsole.new
      console.stub_get_input('5')

      game = Game.new(board, console)

      game.play

      expected_output  = "   |   |  \n"
      expected_output += "-----------\n"
      expected_output += "   | X |  \n"
      expected_output += "-----------\n"
      expected_output += "   |   |  \n"
      expect(console.print_message(console.printed_string)).to eq(expected_output)
    end

    it 'marks a board appropriately with an X in the upper right corner' do
      board = Board.new
      console = FakeConsole.new
      console.stub_get_input('3')

      game = Game.new(board, console)

      game.play

      expected_output  = "   |   | X\n"
      expected_output += "-----------\n"
      expected_output += "   |   |  \n"
      expected_output += "-----------\n"
      expected_output += "   |   |  \n"
      expect(console.print_message(console.printed_string)).to eq(expected_output)
    end
  end

  describe 'game_over?' do
    it 'returns true if there is a winning board' do
      board = Board.new
      console = FakeConsole.new
      game = Game.new(board, console)

      board.mark(6)
      board.mark(7)
      board.mark(8)

      game.game_over?
      expect(game.game_over?).to eq(true)
    end
  end

  describe 'game_over?' do
    it 'returns true if there is a full board' do
      board = Board.new
      console = FakeConsole.new
      game = Game.new(board, console)

      board.mark(0)
      board.mark(1)
      board.mark(2)
      board.mark(3)
      board.mark(4)
      board.mark(5)
      board.mark(6)
      board.mark(7)
      board.mark(8)

      game.game_over?
      expect(game.game_over?).to eq(true)
    end
  end

  describe 'game_over?' do
    it 'returns false if there is not a full board or a winning board' do
      board = Board.new
      # console = FakeConsole.new
      game = Game.new(board)

      board.mark(0)
      board.mark(1, 'O')
      board.mark(2)
      board.mark(7, 'O')
      board.mark(8)

      game.game_over?
      expect(game.game_over?).to eq(false)
    end
  end
end
