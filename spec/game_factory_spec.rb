require 'require_all'
require_all 'lib'
require_relative './fake_console.rb'

describe GameFactory do
  before(:each) do
    @console = FakeConsole.new
    board = Board.new
    display = Display.new(@console, board)
    rules = Rules.new(board)
    menu = Menu.new(display)
    @game_factory = GameFactory.new(board, display, rules, menu)
  end

  describe 'create_game' do
    it 'creates two human players when the user chooses the human player option for both players' do
      @console.stub_get_input(['1', '1', 'X', 'O'])
      @game = @game_factory.create_game

      expect(@game.player_one.mark).to eq('X')
      expect(@game.player_two).to be_a(HumanPlayer)
      expect(@game.player_two.mark).to eq('O')
      expect(@game.player_two).to be_a(HumanPlayer)
    end

    it 'creates a game with player one as a human and player two as a computer' do
      @console.stub_get_input(['1', '2', 'X', 'O'])
      @game = @game_factory.create_game

      expect(@game.player_one.mark).to eq('X')
      expect(@game.player_one).to be_a(HumanPlayer)
      expect(@game.player_two.mark).to eq('O')
      expect(@game.player_two).to be_a(ComputerPlayer)
    end

    it 'creates a game with player one as a computer and player two as a human' do
      @console.stub_get_input(['2', '1', 'X', 'O'])
      @game = @game_factory.create_game

      expect(@game.player_one.mark).to eq('X')
      expect(@game.player_one).to be_a(ComputerPlayer)
      expect(@game.player_two.mark).to eq('O')
      expect(@game.player_two).to be_a(HumanPlayer)
    end

    it 'creates a game with player one as a computer and player two as a computer' do
      @console.stub_get_input(['2', '2', 'X', 'O'])
      @game = @game_factory.create_game

      expect(@game.player_one.mark).to eq('X')
      expect(@game.player_two).to be_a(ComputerPlayer)
      expect(@game.player_two.mark).to eq('O')
      expect(@game.player_two).to be_a(ComputerPlayer)
    end
  end
end
