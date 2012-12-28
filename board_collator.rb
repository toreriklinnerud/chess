class BoardCollator
  def initialize(collection)
    @collection = collection
  end

  def with_letter
    @collection.map do |letter, board|
      board.to_a.map{ |position| position == '1' ? letter : nil }
    end
  end

  def merged
    boards = with_letter
    Array(boards.first).zip(*Array(boards[1..-1])).map do |board|
      board.compact.first || '-'
    end
  end

  def to_s
    merged.each_slice(8).map{ |line| line.join(' ') }.join("\n")
  end
end