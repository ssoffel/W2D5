require 'byebug'

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove_node
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next
    self.next.prev = self.prev
    self.prev = nil
    self.next = nil
  end
end

class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = Node.new
    @tail = Node.new
    setup
  end

  def setup
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    return true if @head.next == @tail
    false
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key, val)
    @tail.prev.next = node
    node.next = @tail
    node.prev = @tail.prev
    @tail.prev = node

  end

  def update(key, val)
    curr_node = @head.next
    until curr_node == @tail
      if curr_node.key == key
        break
      end
      curr_node = curr_node.next
    end
    nil
  end

  def remove(key)
    curr_node = @head.next
    until curr_node == @tail
      debugger
      if curr_node.key == key
        curr_node.remove_node
        break
      end
      curr_node = curr_node.next
    end
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
