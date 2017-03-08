# is unique: implement an algorithm to determine if a string has all unique characters
def is_unique(str)
  count = Hash.new(0)
  str.chars.each do |letter|
    count[letter] += 1
  end
  count.each do |_, val|
    return false if val > 1
  end

  true
end

# p is_unique("hello")
# p is_unique("sdfgh")

# check permutation: given two strings, write a method to decide if one is a permutation of the other
def permutation(str1, str2)
  return false if str1.length != str2.length
  num_times = str1.length
  str1_arr = str1.split("")
  num_times.times do |idx|
    current_char = str1_arr.shift
    if str2.include?(current_char)
      str2.delete!(current_char)
    end
  end

  str2.empty?
end

# p permutation("hello", "lloeh")

# URLify: write a method to replace all spaces in a string with '%20'.
# You may assume that the string has sufficient space at the end to hold the additional characters,
# and that you are given the "true" length of the string

def urlify(str)
  str_arr = str.split(" ")
  str_arr.join("%20")
end

# p urlify("Hello. My name is Chloe")

# palindrome permutation: given a string, write a function to check if it is a permutation of a palindrome
# the palindrome does not need to be limited to just dictionary words

def palindrome_permutation(str)
  count = Hash.new(0)
  num_spaces = 0
  single_counted = false
  str.chars.each do |str|
    count[str] += 1
    num_spaces += 1 if str == " "
  end
  if (str.length - num_spaces) % 2 == 0
    count.each do |key, val|
      next if key == " "
      return false if val != 2
    end
  else
    count.each do |key, val|
      next if key == " "
      return false if val != 2 && single_counted
      single_counted = true if !single_counted && val == 1
    end
  end

  true
end

# p palindrome_permutation("t caocta")

# one away: there are three types of edits that can be performed on strings: insert a character, remove
# a character, or replace a character. Given two strings, write a function to check if they are one edit
# (or zero edits) away

def one_away(str1, str2)
  return true if str1 == str2
  length_diff = str1.length - str2.length
  return false if length_diff < -1 || length_diff > 1
  diff_counted = false

  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.chars.each { |letter| hash1[letter] += 1 }
  str2.chars.each { |letter| hash2[letter] += 1 }
  if length_diff < 0
    hash2.each do |key, val|
      return false if diff_counted && val != hash1[key]
      diff_counted = true if val != hash1[key]
    end
  else
    hash1.each do |key, val|
      return false if diff_counted && val != hash2[key]
      diff_counted = true if val != hash2[key]
    end
  end

  true
end

# p one_away("hello", "hello")
# p one_away("hello", "hellos")
# p one_away("hellop", "hellos")
# p one_away("hell", "hello")
# p one_away("hellfsdf", "hellos")

# string compression: implement a method to perform basic string compression using the counts of repeated
# characters. for ex: the string aabccccaaa would become a2b1c5a3
# if your compressed string is not smaller than the og, return the og string

def string_compression(str)
  current_count = 0
  current_letter = str[0]
  result = ""
  str.chars.each_with_index do |letter, idx|
    if letter == current_letter
      current_count += 1
    elsif letter != current_letter
      result += "#{current_letter}#{current_count}"
      current_letter = letter
      current_count = 1
    end
    result += "#{current_letter}#{current_count}" if idx == str.length - 1
  end
  if result.length > str.length
    return str
  else
    return result
  end
end

# p string_compression("abcde")
# p string_compression("aaavvvddd")

# rotate matrix: given an img represented by a N x N matrix, where each
# pixel in the image is 4 bytes, write a method to rotate the img by 90 deg
# try to do it in place

def rotate_matrix(img)
  (0...(img.length / 2)).each do |layer|
    top_row = img.map do |row|
      img[layer]
    end
    right_col = img.map do |row|
      row[img.length - 1 - layer]
    end
    bottom_row = img[img.length - 1 - layer]
    left_col = img.map do |row|
      row[layer]
    end

  end

  return img
end

p rotate_matrix(
  [
    [1,2,3,4,5],
    [1,2,3,4,5],
    [1,2,3,4,5],
    [1,2,3,4,5],
    [1,2,3,4,5]
  ]
)

# zero matrix: write an algorithm such that if an el in an M x N matrix is 0, its entire row and col are set to 0
def zero_matrix(matrix)
  zeros = []
  (0...matrix.length).each do |row|
    (0...matrix[0].length).each do |col|
      if matrix[row][col] == 0
        zeros << [row, col]
      end
    end
  end

  zeros.each do |coord|
    row = coord[0]
    col = coord[1]
    matrix[row] = Array.new(matrix[0].length) { 0 }
    matrix.each { |r| r[col] = 0 }
  end

  matrix
end

# p zero_matrix(
#   [
#     [1,2,3,4],
#     [4,0,6,5],
#     [7,8,9,1]
#   ]
# )

# string rotation: assume you have a method isSubstring(s1, s1), given 2 strings, check if s1 is
# a rotation of s2 using only one call to isSubstring
# str1 = waterbottle
# str2 = erbottlewat

def string_rotation(str1, str2)
  return false if str1.length != str2.length
  isSubstring(str1, str2 + str2)
end
