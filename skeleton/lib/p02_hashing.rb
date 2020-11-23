class Integer
  # Integer#hash already implemented for you

end

class Array
  def hash
    mapped = self.map.with_index do |ele, i|
      (ele.to_i + i).hash
    end
    mapped.sum
  end
end

class String
  def hash
    mapped = self.split("").map.with_index do |char, i| 
      char + "#{i}"
    end

  mapped.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
