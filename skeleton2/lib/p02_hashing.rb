class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash()
  #   self.each_with_index do |el, index|
  #     if el.is_a?(Array)
  #       counter += 1
  #       el.hash(result, counter)
  #       counter.times  { result /=  2}
  #     elsif el.is_a?(String)
  #       result += el.hash + (index * 11)
  #     else
  #       result += el + (index * 11)
  #     end
  #   end
  #   result
  # end
      self.each_with_index.reduce(100) do |acc, (el, index)|
        acc += el.hash * (index + 1).hash
      end

  end
end

class String
  def hash
    result = 0
    self.each_char.with_index do |char, index|
      result += char.ord * (index + 1 * 11)
    end
    result.hash
  end

end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
  end
end
