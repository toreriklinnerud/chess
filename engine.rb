class Engine
  require_relative 'board'

  def initialize
  end

  def kings
    board = Board.new(0)
    board.one(:e1)
    board.one(:e8)
    board
  end

  def horses
    board = Board.new(0)
    board.one(:b1)
    board.one(:g1)
    board.one(:b8)
    board.one(:g8)
    board
  end

  def white_pieces
    board = Board.new(0)
    Board.map_positions { |x, y| board.one(x, y) if y == 0 || y == 1 }
    board
  end

  def black_pieces
    board = Board.new(0)
    Board.map_positions { |x, y| board.one(x, y) if y == 6 || y == 7 }
    board
  end
end