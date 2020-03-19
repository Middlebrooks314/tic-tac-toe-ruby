require './lib/human_player.rb'
require_relative './fake_console.rb'

describe HumanPlayer do
  it 'initializes a human player with a mark' do
    console = FakeConsole.new
    board = Board.new
    human_player = HumanPlayer.new('X', console, board)

    expect(human_player.mark).to eq('X')
  end

  it 'asks the current player for their move' do
    console = FakeConsole.new
    board = Board.new
    human_player = HumanPlayer.new('X', console, board)
    console.stub_get_input([4])
    human_player.move

    expect(console.printed_string).to eq('Player X, please enter a position 1-9 that is not already marked')
  end

  it 'marks the board with the user\'s input when they choose a move between 1-9 and is not already marked' do
    console = FakeConsole.new
    board = Board.new
    human_player = HumanPlayer.new('X', console, board)
    console.stub_get_input([5])

    expect(human_player.move).to eq(4)
  end
end
