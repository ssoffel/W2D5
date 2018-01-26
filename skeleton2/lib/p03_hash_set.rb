require 'byebug'

require_relative 'p02_hashing'

class HashSet
  attr_reader :count
  attr_reader :num_buckets
  attr_accessor :store

  def initialize(num_buckets = 8)
    @store =  Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(key)
    # debugger
    resize! if @count == @num_buckets
    @count += 1
    key = key.hash.abs
    self[key] << key
  end

  def include?(key)
    key = key.hash.abs
    self[key].each { |el| return true if el == key }
    false

  end

  def remove(key)
    key = key.hash.abs
    if self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    @store[num % @num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @num_buckets = @num_buckets * 2
    temp = Array.new(@num_buckets) { Array.new }
    @store.flatten.each do |el|
      temp[el % @num_buckets] << el
    end
    @store = temp
    end

end
