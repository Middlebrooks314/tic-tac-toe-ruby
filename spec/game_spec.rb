require_relative '../lib/game.rb'

describe Game, :type => :class do
    it('is valid with valid attributes') do
        expect { Game }.not_to raise_exception(NameError)
    end
end