class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hashed_arr = []
    self.each_with_index do |el, index|
      hashed_arr << (index.hash + el.hash).to_s
    end

    hashed_arr.join("").to_i
  end
end

class String
  def hash
    hashed_str = ""
    self.each_char do |char|
      hashed_str += (self.index(char).hash + char.ord.hash).to_s
    end

    hashed_str.to_i
  end
end

class Hash
  def hash
    hashed_hash = 0
    self.each do |key, val|
      hashed_hash += (key.hash + val.hash)
    end

    hashed_hash
  end
end
