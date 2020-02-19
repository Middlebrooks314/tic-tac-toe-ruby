# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/game'

describe Game, type: 'class' do
  it('is valid with valid attributes') do
    expect { Game }.not_to raise_error(NameError)
  end

    describe "#display_board" do
        it 'prints a blank board when the board array is empty' do
        game = Game.new

        board = [" "," "," "," "," "," "," "," "," "]

        expected_output  = "   |   |   \n"
        expected_output += "-----------\n"
        expected_output += "   |   |   \n"
        expected_output += "-----------\n"
        expected_output += "   |   |   \n"

        expect{game.display_board(board)}.to output(expected_output).to_stdout
      end

      it "prints a board with a character in the center position" do
      game = Game.new
      board = [" ", " ", " ", " ", "X", " ", " ", " ", " "]

      expected_output  = "   |   |   \n"
      expected_output += "-----------\n"
      expected_output += "   | X |   \n"
      expected_output += "-----------\n"
      expected_output += "   |   |   \n"

      expect{game.display_board(board)}.to output(expected_output).to_stdout

    end

  end
end
