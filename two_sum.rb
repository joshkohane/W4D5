def bad_two_sum?(arr, target_sum)
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end
    false
end
# O(n^2 )

def okay_two_sum?(arr, target_sum)
    arr = arr.sort
    arr.each_with_index do |el,i|
        return true if bsearch((arr[0...i]+arr[i+1..-1]), (target_sum - el)) != nil
    end
    false
end

def bsearch(arr, target, min = 0, max = arr.length)
    return nil if min == max
    mid = (max - min) / 2 + min
    
    case arr[mid] <=> target
    when 0
        mid
    when 1
        bsearch(arr, target, min, mid)
    else
        bsearch(arr, target, mid + 1, max)
    end
end
# O(nlogn, logn, n) => O(nlogn)

def two_sum?(arr, target_sum)
    hash = {}
    arr.each_with_index { |el, i| hash[el] = i }
    hash.each do |k, v| 
        return true if hash.has_key?(target_sum - k) && hash[target_sum - k] != v
    end
    false
end
# O(n + n) => O(n)

def two_sum?(arr, target_sum)
    hash = {}
    arr.each do |el|
        return true if hash[target_sum - el]
        hash[el] = true
    end
    false
end
# O(n)

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

# arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false