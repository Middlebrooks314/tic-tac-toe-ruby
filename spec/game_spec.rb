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

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   | X |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect(console.print_message(console.printed_string)).to eq(expected_output)
    end

    it 'marks a board appropriately with an X in the upper right corner' do
      board = Board.new
      console = FakeConsole.new
      console.stub_get_input('3')

      game = Game.new(board, console)

      game.play

      expected_output  = "   |   | X \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"
      expect(console.print_message(console.printed_string)).to eq(expected_output)
    end
  end
end
