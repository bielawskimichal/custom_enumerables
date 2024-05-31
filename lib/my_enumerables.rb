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
    res = []
    my_each { |e| res << e if yield e }
    return res
  end

  def my_count
    return length unless block_given?
    i = 0
    my_each { |e| i += 1 if yield e }
    i
  end
  
  def my_each_with_index
    length.times { |i| yield self[i], i }
    self
  end
  
  def my_inject(init_val)
    sum = init_val
    my_each {|e| sum = yield sum, e }
    sum
  end
  
  def my_map
    res = []
    my_each {|e| res << yield(e) }
    res
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
