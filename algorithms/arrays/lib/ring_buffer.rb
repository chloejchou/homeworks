require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @capacity = 8
    @start_idx = 0
    @length = 0
  end

  # O(1)
  def [](index)
    raise("index out of bounds") if @length == 0
    raise("index out of bounds") if index > @length - 1

    @store[(@start_idx + index) % capacity]
  end

  # O(1)
  def []=(index, val)
    @store[(@start_idx + index) % capacity] = val
  end

  # O(1)
  def pop
    raise("index out of bounds") if @length == 0
    last_el = self[length - 1]
    self[length - 1] = nil
    @length -= 1

    last_el
  end

  # O(1) ammortized
  def push(val)
    if @length == @capacity
      resize!
    end
    self[length] = val
    @length += 1

    nil
  end

  # O(1) ammortized
  def unshift(val)
    if @length == @capacity
      resize!
    end

    @start_idx = (@start_idx - 1) % capacity

    self[0] = val
    @length += 1
  end

  # O(1)
  def shift
    raise("index out of bounds") if @length == 0
    first_el = self[0]
    self[0] = nil
    @length -= 1
    @start_idx = ((@start_idx + 1) % @capacity)

    first_el
  end


  protected

  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    new_capacity = @capacity * 2
    new_store = StaticArray.new(new_capacity)
    @length.times { |i| new_store[i] = self[i] }

    @capacity = new_capacity
    @store = new_store
    @start_idx = 0
  end
end
