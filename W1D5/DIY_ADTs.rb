# Exercise 1

class Stack
  attr_reader :stack

  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def add(el)
    # adds an element to the stack
    @stack << el
  end

  def remove
    # removes one element from the stack
    @stack.pop
  end

  def show
    # return a copy of the stack
    p stack
  end
end

# Exercise 2 [first in line...last in line]
class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    p queue
  end
end

if __FILE__ == $PROGRAM_NAME
  new_queue = Queue.new
  new_queue.enqueue("jennifer")
  new_queue.enqueue("goodbye")
  new_queue.show
  new_queue.dequeue
  new_queue.show
end

# Exercise 3

class Map
  attr_reader :map

  def initialize
    @map = []
  end

  # can be used to either create a new key-value pair or
  # update the value for a pre-existing key
  def assign(key, value)
    exists = false
    map.each_with_index do |_, pair_idx|
      if map[pair_idx][0] == key
        exists = true
        @map[pair_idx][1] = value
      end
    end

    @map << [key, value] unless exists
  end

  def lookup(key)
    arr = map.select do |pair|
      k, _ = pair
      key == k
    end

    arr
  end

  def remove(key)
    @map.reject! { |pair| pair[0] == key }
  end

end
