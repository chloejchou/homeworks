class BinaryMinHeap
  def initialize(&prc)
    @store = Array.new
    @prc = prc
  end

  def count
    @store.length
  end

  def extract
    raise "no element to extract" if count == 0

    val = store[0]

    if count > 1
      store[0] = store.pop
      self.class.heapify_down(@store, 0, &prc)
    else
      store.pop
    end

    val
  end

  def peek
    raise "no element to peek" if count == 0
    @store[0]
  end

  def push(val)
    @store << val
    self.class.heapify_up(@store, count - 1, &prc)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    if ((parent_index * 2) + 1) >= len
      return []
    elsif ((parent_index * 2) + 1) < len && ((parent_index * 2) + 2) >= len
      return [(parent_index * 2) + 1]
    else
      return [(parent_index * 2) + 1, (parent_index * 2) + 2]
    end
  end

  def self.parent_index(child_index)
    if ((child_index - 1) / 2) < 0
      raise "root has no parent"
    else
      (child_index - 1) / 2
    end
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    l_child_idx, r_child_idx = child_indices(len, parent_idx)

    parent_val = array[parent_idx]

    children = []
    children << array[l_child_idx] if l_child_idx
    children << array[r_child_idx] if r_child_idx

    if children.all? { |child| prc.call(parent_val, child) <= 0 }
      # Leaf or both children_vals <= parent_val. As a convenience,
      # return the modified array.
      return array
    end

    # Choose smaller of two children.
    swap_idx = nil
    if children.length == 1
      swap_idx = l_child_idx
    else
      swap_idx =
        prc.call(children[0], children[1]) == -1 ? l_child_idx : r_child_idx
    end

    array[parent_idx], array[swap_idx] = array[swap_idx], parent_val
    heapify_down(array, swap_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    # As a convenience, return array
    return array if child_idx == 0

    parent_idx = parent_index(child_idx)
    child_val, parent_val = array[child_idx], array[parent_idx]
    if prc.call(child_val, parent_val) >= 0
      # Heap property valid!
      return array
    else
      array[child_idx], array[parent_idx] = parent_val, child_val
      heapify_up(array, parent_idx, len, &prc)
    end
  end
end
