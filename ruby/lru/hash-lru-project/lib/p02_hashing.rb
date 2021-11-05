class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_val = 0 # start at 0 to XOR every element
    each_with_index do |el, i|
      hash_val += (el.hash + i.hash) ^ hash_val
    end
    hash_val
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort_by(&:hash).hash
  end
end
