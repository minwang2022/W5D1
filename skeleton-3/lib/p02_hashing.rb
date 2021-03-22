class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    combined_hash = 0

    self.each_with_index do |el, i|
     
     combined_hash += el.hash / i.hash
     
    end
    combined_hash

  end
end

class String
  def hash
    combined_hash = 0 
    self.chars.each_with_index do |char, i|
      combined_hash += char.bytes.hash / i.hash   
    end
    combined_hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    combined_hash = 0

    self.to_a.each_with_index do |el, i|
     
     combined_hash += el.hash / i.hash
     
    end
    combined_hash

  end
end
