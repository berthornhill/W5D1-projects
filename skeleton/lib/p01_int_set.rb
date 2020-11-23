class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(max) {false}
  end

  def insert(num)
    validate!(num)

    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)

    @store[num]
  end

  private

  def is_valid?(num)
    return true if num >= 0 && num < @max
    false
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    include?(num) ? nil : self[num] << num
  end

  def remove(num)
    self[num].delete(num)
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
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num) 
      @count += 1
      # print @store.count
      resize! if @count > num_buckets

      self[num] << num
      # print @store.count
      print self
    end      
  end

  def remove(num)
    if include?(num) 
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  def inspect
    @store.count
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
    if count == num_buckets
      count = 0
      temp_store = @store.dup.flatten
      @store = Array.new(num_buckets * 2) {Array.new}
      temp_store.each do |ele|
        insert(ele)
      end
      print temp_store
    end
  end
end
