# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/game'

describe Game, type: 'class' do
  it('is valid with valid attributes') do
    expect { Game }.not_to raise_error(NameError)
  end
    it 'prints a 3x3 tic tac toe board' do
        game = Game.new
        expected_output  = "   |   |   \n"
        expected_output += "-----------\n"
        expected_output += "   |   |   \n"
        expected_output += "-----------\n"
        expected_output += "   |   |   \n"
        expect{game.display_board}.to output(expected_output).to_stdout
    end
end
