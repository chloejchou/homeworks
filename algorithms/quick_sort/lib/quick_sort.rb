class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2
    pivot_idx = rand(array.length)
    array[0], array[pivot_idx] = array[pivot_idx], array[0]
    pivot = array[0]
    left = array.select { |el| el < pivot }
    mid = array.select { |el| el == pivot }
    right = array.select { |el| el > pivot }
    sorted_left = sort1(left)
    sorted_right = sort1(right)
    sorted_left + mid + sorted_right
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    return array if length < 2

    pivot_idx = partition(array, start, length, &prc)

    sort2!(array, start, pivot_idx - start, &prc)
    sort2!(array, pivot_idx + 1, length - (pivot_idx - start + 1), &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    pivot_idx = start
    pivot = array[pivot_idx]

    ((start + 1)...(start + length)).each do |idx|
      if prc.call(pivot, array[idx]) > 0
        array[idx], array[pivot_idx + 1] = array[pivot_idx + 1], array[idx]
        pivot_idx += 1
      end
    end

    array[start], array[pivot_idx] = array[pivot_idx], array[start]

    pivot_idx
  end
end
