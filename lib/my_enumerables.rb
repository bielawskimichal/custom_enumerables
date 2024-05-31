module Enumerable
  def my_any?
    self.my_each { |elem| return true if yield elem }
    return false
  end
  
  def my_all?
    self.my_each { |elem| return false unless yield elem }
    return true
  end

  def my_none?
    self.my_each { |elem| return false if yield elem }
    return true
  end
  
  def my_select
    array = []
    self.my_each { |elem| array.push(elem) if yield elem }
    return array
  end

  def my_count
    return self.length unless block_given?
    i = 0
    self.my_each { |elem| i += 1 if yield elem }
    i
  end
  
  def my_each_with_index
    i = 0
    length.times { yield self[i], i and i += 1 }
    self
  end
  
  def my_inject(initial_value)
    i = 0
    sum = initial_value
    length.times { 
      sum if i == 0
      sum = yield(sum, self[(i - 1)]) and i += 1
    }
    sum
  end
  
  def my_map
    i = 0
    array = []
    length.times { array.push(yield self[i]) and i+=1 }
    array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    length.times {
      yield self[i]
      i += 1
    }
    self
  end
end
