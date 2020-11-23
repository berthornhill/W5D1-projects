class Node
  
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new()
    @tail = Node.new()

    @head.next = @tail
    @tail.prev = @head

    @list = []
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
    @head.next == @tail
    
  end

  def get(key)

  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.prev = @tail.prev
    @tail.prev.next = new_node
    new_node.next = @tail
    @tail.prev = new_node
 

    #find tail and add new node in front of tail.
    # new_node previous points to current tail's previous
    # new_node next becomes tail.
    # tail's previous becomes new_node.
  end

  def update(key, val)
  end

  def remove(key)

  end

  def each(&prc)
    # node = first
    # until node == @tail
    #   prc.call(node)
    #   node = node.next
    # end

    prc.call(first)
    last.each(&prc) if last
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
