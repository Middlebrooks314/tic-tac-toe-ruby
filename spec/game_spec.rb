require_relative '../lib/game.rb'

Rspec.describe Game, :type => :class do
    it('is valid with valid attributes') do
        expect(Game.new).to_be_valid
    end
end