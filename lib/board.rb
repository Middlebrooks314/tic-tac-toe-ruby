class Board
  attr_reader :squares

  def initialize(squares = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    @squares = squares
  end

  def display
    <<-HEREDOC
 #{@squares[0]} | #{@squares[1]} | #{@squares[2]}
-----------
 #{@squares[3]} | #{@squares[4]} | #{@squares[5]}
-----------
 #{@squares[6]} | #{@squares[7]} | #{@squares[8]}
    HEREDOC
  end

  def position_taken?(index)
    @squares[index] != ' '
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def mark(index, mark = 'X')
    @squares[index] = mark
  end

  def full?
    @squares.all? do |index|
      index != ' '
    end
  end
end
