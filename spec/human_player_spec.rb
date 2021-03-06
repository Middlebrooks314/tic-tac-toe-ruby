require 'require_all'
require_all 'lib'
require_relative './fake_console.rb'

describe HumanPlayer do
  it 'initializes a human player with a mark' do
    console = FakeConsole.new
    board = Board.new
    display = Display.new(console, board)
    human_player = HumanPlayer.new('X', board, display)

    expect(human_player.mark).to eq('X')
  end

  it 'marks the board with the user\'s input when they choose a move between 1-9 and is not already marked' do
    console = FakeConsole.new
    board = Board.new
    display = Display.new(console, board)
    human_player = HumanPlayer.new('X', board, display)
    board.mark(0)
    board.mark(8)
    console.stub_get_input([5])

    human_player.move

    expect(board.available_moves).to eq([1, 2, 3, 5, 6, 7])
  end
end
