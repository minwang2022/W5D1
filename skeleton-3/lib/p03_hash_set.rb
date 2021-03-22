class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    self[key.hash] << key
    self.count += 1
    resize! if self.count >= num_buckets
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    return false if !self[key]
    self.count -= 1 if self[key.hash].delete(key) 
    
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
