class Horse
	def possible_moves
    Board.map_positions do |x, y|
      b = Board.new(0)
      b.one(x - 2, y - 1)
      b.one(x - 2, y + 1)
      b.one(x - 1, y - 2)
      b.one(x - 1, y + 2)
      b.one(x + 2, y + 1)
      b.one(x + 2, y - 1)
      b.one(x + 1, y + 2)
      b.one(x + 1, y - 2)
      b.to_i
    end
	end
end