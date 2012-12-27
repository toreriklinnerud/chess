class King
	def possible_moves
    Board.map_positions do |x, y|
      b = Board.new(0)
      b.one(x - 1, y - 1)
      b.one(x - 1, y)
      b.one(x - 1, y + 1)
      b.one(x, y - 1)
      b.one(x, y + 1)
      b.one(x + 1, y - 1)
      b.one(x + 1, y)
      b.one(x + 1, y + 1)
      puts b
      puts
      b.to_i
    end
	end
end