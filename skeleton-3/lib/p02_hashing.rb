class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    combined_hash = []

    self.each_with_index do |el, i|
      return self.hash if self.empty?
      combined_hash << [el.hash + i.hash]
      # combined_hash << i.hash
    end
  #   self.each_with_index do |k, i2|
  #     (0...combined_hash.length).each do |j|
  #       j.hash ^ (k.hash + i2.hash)
  #     end
  #  end

  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
