class Engine
  require_relative 'board'
  require_relative 'board_collator'
  require_relative 'king'
  require_relative 'horse'

  def initialize
    @white_king = Board.place_piece(:e1)
    @white_horses = Board.place_piece(:b1, :g1)
    @black_king = Board.place_piece(:e8)
    @black_horses = Board.place_piece(:b8, :g8)

    @white_pieces = {'K' => @white_king, 'H' => @white_horses}
    @black_pieces = {'k' => @black_king, 'h' => @black_horses}
    @pieces = @white_pieces.merge(@black_pieces)
  end

  def tick
    puts BoardCollator.new(@pieces)
    # move_black
  end

  def next_moves(pieces = @black_pieces)
    pieces.flat_map do |piece, board|
      board.positions.map do |position|
        puts [piece, position]
        if piece == 'k'
          King.new.possible_moves[position]
        elsif piece == 'h'
          Horse.new.possible_moves[position]
        end
      end
    end
  end
end