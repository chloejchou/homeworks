require 'set'

# Write a method that will sum the digits of a positive integer.
# If it is greater than or equal to 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result.
# The result is called a 'digital root'.
# Do not use string conversion within your method.
def digital_root(number)
  return number if number < 10
  sum = 0
  number.to_s.split("").each do |num|
    sum += num.to_i
  end

  digital_root(sum)
end

# Write a function that takes a message and an increment amount.
# Output the same letters shifted by that amount in the alphabet.
# Assume lowercase and no punctuation.
# Preserve spaces.
def caesar_cipher(string, shift)
  answer = []
  string.split("").each do |letter|
    new_ord = ((letter.ord + shift) % 123)
    new_ord += 97 if new_ord < 97
    puts new_ord
    answer << new_ord.chr
  end

  answer.join("")
end

# puts caesar_cipher("yyy", 1)

# Write a function that takes two strings.
# Return the longest common substring.
def common_substrings(string_one, string_two)
  answer = ""
  start_idx = 0
  end_idx = 0
  while start_idx < string_one.length
    while end_idx < string_one.length
      substring = string_one[start_idx..end_idx]
      if string_two.include?(substring)
        answer = substring if answer.length < substring.length
        puts answer
      end
      end_idx += 1
    end
    start_idx += 1
    end_idx = start_idx
  end

  answer
end

# common_substrings("cat", "hell")

# Write a function that takes an array of integers and returns their sum.
# Use recursion.
def sum_rec(numbers)
  return numbers[0] if numbers.length == 1
  numbers[0] + sum_rec(numbers[1..-1])
end

# puts sum_rec([1,2,3,4,5])

# Write a function that takes n, the length of the sequence.
# Return the first n elements from the fibonnacci sequence as an array.
def fibs(n)
  return [] if n < 1
  return [1] if n == 1
  return [1, 1] if n == 2
  one_before = fibs(n - 1)
  last_el = one_before[-1] + one_before[-2]

  one_before << last_el
  one_before
end

# p fibs(10)

# Write a function that takes a string.
# Return true if the string is a palindrome, otherwise return false.
# It should take less time and memory than reversing the string.
def is_palindrome?(string)
  el_one = 0
  el_two = -1
  until el_one == string.length / 2
    if string[el_one] == string[el_two]
      el_one += 1
      el_two -= 1
    else
      return false
    end
  end

  true
end

# p is_palindrome?("racecar")
# p is_palindrome?("dad")
# p is_palindrome?("hello")

# Write a method that takes a string as input.
# It should return true if the input is a valid IPv4 address.
# Valid IPs are anything between '0.0.0.0' and '255.255.255.255'.
def valid_ip?(string)
  address = string.split(".")
  return false if address.length != 4
  address.each do |num|
    return false if num.to_i < 0 || num.to_i > 255
  end

  true
end

# p valid_ip?("0.0.0.0")
# p valid_ip?("1000.0.0.0")
# p valid_ip?("255.0.0")

# Implement the Folding Cipher.
# It folds the alphabet in half and uses the adjacent letter.
# a -> z, b -> y, c -> x, m -> n, etc...
def folding_cipher(string)
  hash = {}
  alphabet = ('a'..'z').to_a
  alphabet_reverse = ('a'..'z').to_a.reverse
  alphabet.each_with_index do |letter, idx|
    hash[letter] = alphabet_reverse[idx]
  end

  answer = ""
  string.chars.each do |letter|
    answer += hash[letter]
  end

  answer
end

# p folding_cipher("aaa")
# p folding_cipher("abc")

# Write a method that finds all the unique substrings for a word.
def uniq_subs(string)
  subs = []
  start_idx = 0
  last_idx = 0
  while start_idx < string.length
    while last_idx < string.length
      subs << string[start_idx..last_idx] unless subs.include?(string[start_idx..last_idx])
      last_idx += 1
    end
    start_idx += 1
    last_idx = start_idx
  end

  subs
end

# p uniq_subs("hello")

# Given an array of integers find the largest contiguous subsum.
# You can solve this trivially in O(n**2) time by considering all subarrays.
# Try to solve it in O(n) time with O(1) memory.
def lcs(array)
  current_sum = 0
  largest_sum = array[0]

  array.each do |el|
    current_sum += el
    current_sum = 0 if current_sum < 0
    largest_sum = current_sum if largest_sum < current_sum
  end

  largest_sum
end

# p lcs([0, 4, 5, -10, 200])

# Write a function that takes a year as a four digit integer.
# Returns an array of the 10 closest subsequent silly years.
# A silly year's first two digits plus the last two digits equal the middle two.
def silly_years(year)
  answer = []
  current_year = year
  while answer.length < 10
    string_year = current_year.to_s
    middle = string_year[1..2]
    sum = string_year[0..1].to_i + string_year[2..3].to_i
    answer << current_year if sum.to_s == middle
    current_year += 1
  end

  answer
end

# p silly_years(1111)

# Take an array of integers, and integer k.
# Return all pairs that sum to k exactly.
# List the pairs in [min, max] order.
# Time complexity: O(n).
# Return a set.
def pair_sum(array, k)
  set = Set.new
  hash = Hash.new
  array.each do |el|
    hash[el] = k - el
  end

  array.each do |el|
    if array.include?(hash[el])
      set << [el, hash[el]].sort
    end
  end

  set
end

# p pair_sum([1, 4, 5, -1, -5, 10, 3], 0)

# Take a matrix of integers and coordinates.
# The coordinates represent a rectangular region within the matrix
# Find the sum of numbers falling inside the rectangle.
# Time complexity: O(number of rows * number of columns).
def matrix_region_sum(matrix, top_left_coords, bottom_right_coords)
  sum = 0
  (top_left_coords[0]..bottom_right_coords[0]).each do |row|
    (top_left_coords[1]..bottom_right_coords[1]).each do |col|
      sum += matrix[row][col]
    end
  end

  sum
end

# matrix = [
#   [1, 2, 3, 5],
#   [4, 5, 6, 5],
#   [7, 8, 9, 5]
# ]
# p matrix_region_sum(matrix, [0, 0], [2, 1])

# Implement Merge Sort
# Hint: This typically involves a helper function.
def merge_sort(array)
  return array if array.length == 1
  mid = array.length / 2
  left = array[0...mid]
  right = array[mid..-1]
  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)

  merge(sorted_left, sorted_right)
end

def merge(left, right)
  sorted_arr = []
  until left.empty?|| right.empty?
    if left[0] > right[0]
      sorted_arr << right.shift
    else
      sorted_arr << left.shift
    end
  end

  sorted_arr + right + left
end

# p merge_sort([1,5,4,2,7,6,0])

# Implement binary search.
# Return nil if the target isn't found.
def binary_search(array, target)
  return nil if array.length < 2 && array[0] != target
  mid = array.length / 2
  if array[mid] == target
    return mid
  elsif array[mid] > target
    return binary_search(array[0...mid], target)
  else
    return mid + 1 + binary_search(array[mid + 1..-1], target)
  end
end

# p binary_search([1,2,5,6,7,8], 8)
# p binary_search([1,2,5,6,7,8], 2)

# You are given a list of numbers in an array.
# Replace all the numbers with the product of all other numbers.
# Do this in O(n) time without using division.
def productify(array)
  answer = []
  array.each_with_index do |el, idx|
    if array[idx - 1]
      answer << (array[idx - 1] * answer[idx - 1])
    else
      answer << el
    end
  end

  (array.length - 1).downto(0).each do |idx|
    if array[idx + 1]
      answer[idx] *= (array[idx + 1] * answer[idx + 1])
    end
  end

  answer
end

# p productify([1,4,5,6])

# Write a function that takes an array and returns all of its subsets.
def subsets(array)
  return [[]] if array.length == 0
  smaller_subset = subsets(array[1..-1])
  answer = []
  smaller_subset.each do |subset|
    answer << ([array[0]] + subset)
  end

  smaller_subset + answer
end

# p subsets([1, 2, 3])

# Return the indices of the start/end of the longest palindrome in the string.
# You could reverse the string and compare it to the original, but that is slow.
# Instead, you should be able to solve the problem with O(1) memory.
def longest_palindrome(string)
  # ?????
end

# Given two arrays, find the intersection of both sets.
# It should be trivial to write an O(n**2) solution.
# Use sorting to solve in O(nlog(n)).
# Next, improve this to O(n) time (maybe use a non-array datastructure).
def fast_intersection(array_one, array_two)
  intersection = []
  hash = Hash.new(0)
  array_one.each do |el|
    hash[el] += 1
  end
  array_two.each do |el|
    hash[el] += 1
  end

  hash.each do |k, v|
    intersection << k if v == 2
  end

  intersection
end

# p fast_intersection([1,2,3,5], [3,4,5])

# Write a function that takes two arrays of integers
# Returns an array with all the subsets commmon to both arrays.
# Don't generate all subsets of both arrays, which would be exponential time.
# Instead, directly generate the subsets of both.
def common_subsets(array_one, array_two)

end

# You are given an array and index.
# Find if it's possible to reach 0 by starting at the index.
# You can only move left or right by the distance found at array[index].
def can_win?(array, index, seen = {})
  return false if !index.between?(0, array.length - 1) || seen[index]
  return true if array[index] == 0

  seen[index] = true
  step_size = array[index]

  can_win?(array, index + step_size, seen) || can_win?(array, index - step_size, seen)
end

# Assume an array of length n, containing the numbers 1..n in jumbled order.
# "Sort" this array in O(n) time.
# Hint: You should be able to do this without looking at the input.
def sort1(array)

end

# Assume an array of length n with numbers in the range 1..N (N >= n).
# Sort this array in O(n + N) time.
# You may use O(N) memory.
def sort2(array, max_value)

end

# Say I give you an array of n strings, each of length k.
# Merge sort can sort this in O(knlog(n)).
# Sort the strings in O(kn).
# Hint: Do not compare any two strings.
# All strings contain only lowercase letters without whitespace or punctuation.
def sort3(array, length)

end

# Given an array, write a function that will return a random index of the array.
# The chance of returning a given index will vary with the value of the element.
# Probability of i should be the ith element divided by the sum of all elements.
def weighted_random_index(array)

end

# Given an array, move all zeros to the end.
# The order of non-zero elements does not matter.
# Try to accomplish this in O(n) time and O(1) space.
def move_zeros(array)

end

# Implement the 'look and say' function.
#'Look and say' takes an input array and outputs an array.
# The output describes the count of the elements in the input.

def look_and_say(array)

end

# I give you a scrambled list of n unique integers between 0 and n.
# Tell me what number is missing?
# How could you solve the problem in O(n), and also O(1) space?
def sum_upon_sums(array)

end

# Implement a stack with a max method that returns the maximum value.
# It should run in O(1) time.
class MaxStack
  attr_accessor :stack

  def initialize
    @stack = []
    @max_stack = []
  end

  def remove
    @max_stack.pop
    @stack.pop
  end

  def add(item)
    current_max = @max_stack[-1] || -1.0 / 0.0
    @stack << item
    if item > current_max
      @max_stack << item
    else
      @max_stack << current_max
    end

    @stack
  end

  def max
    @max_stack[-1]
  end
end

# stack = MaxStack.new
# stack.add(1)
# stack.add(10)
# stack.add(11)
# stack.remove
# p stack.max

# Implement a queue using stacks.
# That is, write enqueue and dequeue using only push and pop operations.
# In terms of performance, enqueue should be O(1).
# Dequeue may be worst-case O(n).
# In terms of ammortized time, dequeue should be O(1).
# Prove that your solution accomplishes this.
class StackQueue
  def initialize
    @in_stack = []
    @out_stack = []
  end

  def enqueue(item)
    @in_stack.push(item)
  end

  def dequeue
    if @out_stack.empty?
      until @in_stack.empty?
        last_el = @in_stack.pop
        @out_stack << last_el
      end
    end

    @out_stack.pop
  end

  def show
    stack = []
    @out_stack.each do |el|
      stack << el
    end

    stack + @in_stack
  end
end

# stack_queue = StackQueue.new
# stack_queue.enqueue(1)
# stack_queue.enqueue(2)
# stack_queue.enqueue(3)
# stack_queue.dequeue
# stack_queue.dequeue
# stack_queue.enqueue(4)
# stack_queue.enqueue(5)
# p stack_queue.show

# Take an array, and a window size w.
# Find the maximum max - min within a range of w elements.
# First solve MaxStack.
# Write a MinMaxStack to track both the min and the max in a stack.
# Next, solve StackQueue.
# Write a MinMaxStackQueue which tracks both the min and max.
# Last, use MinMaxStackQueue to solve the problem.
class MinMaxStack

end

class MinMaxStackQueue

end

def windowed_max_range(array, w)

end

# Suppose a hash representing a directory.
# All keys are strings with names for either folders or files.
# Keys that are folders point to nested hashes.
# Keys that are files point to "true".
# Write a function that takes such a hash.
# Return an array of strings with the path to each file in the hash.
def file_list(hash)

end

# Assume an array of non-negative integers.
# A second array is made by shuffling the first and deleting a random element.
# Given these two arrays, find which element is missing in the second array.
# Do this in linear time with constant memory use.
def find_missing_number(array_one, array_two)

end

# Create a function that takes three strings.
# Return whether the third is an interleaving of the first two.
# Interleaving means it contains the same characters and preserves their order.
def is_shuffle?(string_one, string_two, string_three)

end

# Write a function that takes an integer and returns it in binary form.
def binary(integer)

end

# Write a recursive function that takes a number and returns its factorial.
def recursive_factorial(number)
  return 1 if number < 1
  number * recursive_factorial(number - 1)
end

# p recursive_factorial(4)

# Write an iterative function that takes a number and returns its factorial.
def iterative_factorial(number)
  return 1 if number < 1
  answer = 1
  until number == 1
    answer *= number
    number -= 1
  end
  answer
end

# p iterative_factorial(4)

# Write a method that takes an array and returns all its permutations.
def permutations(array)
  return [[]] if array.empty?
  answer = []
  array.length.times do |i|
    el = array[i]
    rest = array[0...i] + array[(i + 1)..-1]

    perms = permutations(rest).map { |perm| perm.unshift(el) }
    answer += perms
  end

  answer
end

# p permutations([1,2,3])
