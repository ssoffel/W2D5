class MaxIntSet
  attr_reader :max
  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(max) { [false] }
  end

  def insert(num)
    unless num.between?(0, max)
      raise 'Out of bounds'
    end
    if @store[num] == [false]
      @store[num] = [true]
    end
  end

  def remove(num)
    unless num.between?(0, max)
      raise 'num out of bounds'
    end
    if @store[num] == [true]
      @store[num] = [false]
    end
  end

  def include?(num)
    unless num.between?(0, max)
      raise 'num out of bounds'
    end
    return true if @store[num] == [true]
    false
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_accessor :store
  attr_reader :num_buckets

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
      self[num].each {|element| return true if element == num }
      false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    number = num % num_buckets
    @store[number]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :num_buckets

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)
    unless include?(num)
      resize! if count == num_buckets
      @count += 1
      self[num] << num
    end
  end

  def remove(num)

    if self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].each { |el| return true if el == num }
    false
  end

  private

  def [](num)
    number = num % num_buckets
    @store[number]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @num_buckets = @num_buckets * 2
    temp = Array.new(num_buckets) { Array.new }
    @store.flatten.each do |el|
      temp[el % num_buckets] << el
    end
    @store = temp
    end
end
