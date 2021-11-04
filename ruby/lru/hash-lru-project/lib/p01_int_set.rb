class MaxIntSet
  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(@max){false}
  end

  def insert(num)
    # check validity
    validate!(num)
    # no insertion needed if already exists
    return false if @store[num] = true
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    return nil unless @store[num] = true
    @store[num] = false
    num
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @max)
  end

  def validate!(num)
    raise 'Out of bounds' unless is_valid?(num)
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  # return true if number inserted, false otherwise
  def insert(num)
    false if include?(num)
    self[num] << num
    true
  end

  def remove(num)
    self[num].delete(num) if include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # false if item already exists in set
    return false if include?(num)
    self[num] << num
    @count += 1
    resize! if count > num_buckets
    return true
  end

  def remove(num)
    if self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # get length
    length = @store.length
    # create new array with 2 x length spaces
    old_store = store
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }
    # reinsert all objects from original array
    old.flatten.each { |num| insert(num) }
  end
end
