require 'byebug'

def windowed_max_range(arr, w)
    current_max_range = 0
    (0..arr.length-w).each do |i|
        range = arr[i...i+w]
        max = range.max - range.min
        current_max_range = max if max > current_max_range
    end
    current_max_range
end

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
    el
  end

  def dequeue
    @store.shift
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.first
  end
end

class MyStack
  def initialize
    @store = []
  end

  def push(el)
    @store << el
    el
  end

  def pop
    @store.pop
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.last
  end
end

class StackQueue
    def initialize
        @in = MyStack.new
        @out = MyStack.new
    end

    def size
        @in.length + @out.length
    end

    def empty?
        @in.empty? && @out.empty?
    end

    def enqueue(el)
        @in.push(el)
    end

    def dequeue
        dequeify if @out.empty?
         
        @out.pop
    end

    def dequeify
        @out.push(@in.pop) until @in.empty?
    end
end

def MinMaxStack
    def initialize
        @store = MyStack.new
    end

    def push(el)
        @store.push({
            max: new_max(val)
            min: new_min(val)
            value: val
        })
    end

    def pop
        @store.pop[:value] unless empty?
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def peek
        @store.peek[:value] unless empty?
    end

    def min
        @store.peek[:min] unless empty?
    end

    def max
        @store.peek[:max] unless empty? 
    end

    def new_max(val)
        empty? ? val : [max, val].max
    end

    def new_max(val)
        empty? ? val : [min, val].min
    end
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
