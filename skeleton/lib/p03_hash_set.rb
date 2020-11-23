class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    self[key] << key
    resize! if count >= num_buckets
    @count += 1
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    temp_store = @store.flatten.dup 
    @store = Array.new(num_buckets * 2) {Array.new}
    temp_store.each do |ele|
      insert(ele)
    end
    @count
  end
end
