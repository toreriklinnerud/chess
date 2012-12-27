class Board
  ALL_ONES = (2 ** 64) - 1

  def initialize(integer)
    raise ArgumentError, "Too big" if integer > ALL_ONES
    @integer = integer
  end

  def to_s
    ones_and_zeroes = @integer.to_s(2).rjust(64, '0').each_char
    ones_and_zeroes.each_slice(8).map{ |line| line.reverse.join(' ') }.join("\n")
  end

  def one(x, y = nil)
    x, y = symbol_to_x_y(x) if x.is_a?(Symbol)
    return if x < 0 || x > 7 || y < 0 || y > 7
    shift = x + (y * 8)
    @integer = @integer | (1 << shift)
  end

  def to_i
    @integer
  end

  def inspect
    "\n" + to_s
  end

  def symbol_to_x_y(symbol)
    x_name, y_name = symbol.to_s.split('')
    return x_name.ord - 97, y_name.to_i - 1
  end

  def self.map_positions
    (0..7).flat_map { |y| (0..7).map { |x| yield(x, y) } }
  end
end