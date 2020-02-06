require 'spec_helper'
require_relative '../lib/game'

describe Game, :type => :class do
    it('is valid with valid attributes') do
        expect { Game }.not_to raise_error(NameError)
    end
end