module Enumerable
  def my_each
    if block_given?
      for item in self
        yield(item)
      end
      self
    else
      return to_enum(:my_each)  
    end
  end
  
  def my_each_with_index
    if block_given?
      i = 0
      self.my_each { |item|
        yield(item, i)
        i += 1
      }
      return self
    else
      to_enum(:my_each_with_index)
    end
  end
  
  def my_select
    if block_given?
      current = self.dup
      current.clear
      self.my_each { |item| current.push(item) if yield(item) }
      return current
    else
      return to_enum(:my_select)
    end
  end
  
  def my_all?
    if block_given?
      self.my_each { |item| return false unless yield(item) }
      return true
    else
      return to_enum(:my_all?)
    end
  end
  
  def my_any?
    if block_given?
      self.my_each { |item| return true if yield(item) }
      return false
    else
      return to_enum(:my_any?)
    end
  end
  
  def my_none?
    if block_given?
      self.my_each { |item| return false if yield(item) }
      return true
    else
      return to_enum(:my_none?)
    end
  end
  
  def my_count
    if block_given?
      num = 0
      self.my_each { |item| num += 1 if yield(item) }
      return num
    else
      return self.size
    end
  end
  
  def my_map(prc = nil)
    mapped = []
    if prc
      self.my_each { |item| mapped.push(prc.call(item)) }
      return mapped
    elsif block_given?
      self.my_each { |item| mapped.push(yield(item)) }
      return mapped
    else
      return to_enum(:my_map)
    end
  end
  
  def my_inject(var = nil)
    if block_given?
      var ? var = yield(var, self.first) : var = self.first
      self.drop(1).my_each { |item| var = yield(var, item) }
      return var
    else
      return to_enum(:my_inject)
    end
  end
  
end