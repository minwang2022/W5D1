class MaxIntSet

  attr_accessor :store
  def initialize(max)
    @store = Array.new(max, false)

  end
# The MaxIntSet should raise an error if someone tries to insert, remove, or check inclusion of a number that is out of bounds.

  def insert(num)
    raise 'Out of bounds' if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
   @store[num] = false if self.include?(num)
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @store.length-1)
  end

  def validate!(num)
  end
end


class IntSet

  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    self.count += 1
    resize! if self.count >= num_buckets
  end

  def remove(num)

    return false if !self[num]
    self.count -= 1 if self[num].delete(num) 
    
  end

  def include?(num)
     self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    previou_store = self.store
   
    self.count = 0 
    self.store = Array.new(num_buckets * 2) {Array.new}
  
    previou_store.each do |sub_arr|
      sub_arr.each do |num|
        self.insert(num)
       
      end
    end
  end 

end
