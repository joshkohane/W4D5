require 'byebug'
# def my_min(arr)
#     (0...arr.length).each do |i|
#         return arr[i] if (i+1...arr.length).all? { |j| arr[i] < arr[j] }
#     end
# end

def my_min(arr)
    min = arr[0]
    arr.each do |el|
        min = el if el < min
    end
    min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

# def largest_contiguous_subsum(list)
#     subs = []
#     (0...list.length).each do |i|
#         (i...list.length).each do |j|
#             subs << list[i..j]
#         end
#     end
#     max = subs[0]
#     subs.each do |el|
#         max = el if el.sum > max.sum
#     end
#     max.sum
# end

def largest_contiguous_subsum(arr)
    max = arr[0]
    current = 0
    (0...arr.length).each do |i|
        current += arr[i]
        max = current if current > max
        current = 0 if current < 0
    end
    max
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])
