class Sequence
  include Enumerable
  attr_reader :size, :curr

  def initialize(size, *init, &blk)
    @size = size
    @curr = init
    @blk = blk
  end

  def curr
    return @curr.last
  end

  def generate_next
    next_item = @blk.call(@curr)
    @curr << next_item
    return next_item
  end

  def [] i
    if i >= @size || i < 0
      return nil
    elsif i < @curr.length
      return @curr[i]
    else
      count = i - @curr.length + 1
      count.times do
        self.generate_next
      end
      return @curr[i]
    end
  end

  def each
    @size.times do |i|
      yield self[i]
    end
  end
end
