module Enumerable
  def my_any?
    my_each { |e| return true if yield e }
    return false
  end
  
  def my_all?
    my_each { |e| return false unless yield e }
    return true
  end

  def my_none?
    my_each { |e| return false if yield e }
    return true
  end
  
  def my_select
    array = []
    my_each { |e| array << e if yield e }
    return array
  end

  def my_count
    return length unless block_given?
    i = 0
    my_each { |e| i += 1 if yield e }
    i
  end
  
  def my_each_with_index
    i = 0
    my_each { |e| yield e, i and i += 1 }
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
    array = []
    my_each {|e| array << yield(e) }
    array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for e in self
      yield e
    end
    self
  end
end
