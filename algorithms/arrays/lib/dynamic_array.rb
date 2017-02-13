require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = Array.new
    @capacity = 8
    @length = 0
  end

  # O(1)
  def [](index)
    if @store[index]
      @store[index]
    else
      raise("index out of bounds")
    end
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    raise("index out of bounds") if @length == 0
    last_el = self[length - 1]
    self[length - 1] = nil
    @length -= 1

    last_el
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    self[length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise("index out of bounds") if @length == 0
    first_el = self[0]
    self[0] = nil
    (1...self.length).each do |idx|
      self[idx - 1] = self[idx]
    end
    @length -= 1
    first_el
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity
    (self.length - 1).downto(0) do |idx|
      self[idx + 1] = self[idx]
    end
    self[0] = val
    @length += 1

    @store
  end

  protected

  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity = @capacity * 2
  end
end
