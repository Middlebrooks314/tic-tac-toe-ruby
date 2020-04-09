require 'require_all'
require_all 'lib'
require_relative './fake_console.rb'

describe ComputerPlayer do
  it 'initializes a computer player with a mark' do
    console = FakeConsole.new
    board = Board.new
    display = Display.new(console, board)
    computer = ComputerPlayer.new('C', board, display)

    expect(computer.mark).to eq('C')
  end

  it 'marks the board in an available space' do
    console = FakeConsole.new
    board = Board.new
    display = Display.new(console, board)
    computer = ComputerPlayer.new('C', board, display)
    board.mark(0)

    computer.move

    expect(board.available_moves.length).to eq(7)
  end
end
