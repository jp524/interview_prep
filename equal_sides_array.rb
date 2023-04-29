# https://www.codewars.com/kata/5679aa472b8f57fb8c000047/train/ruby

require 'benchmark'

# First solution

# def find_even_index(arr)
#   (0...arr.length).each do |i|
#     left_sum = arr[0...i].sum
#     right_sum = ar®r[i+1..-1].sum

#     return i if left_sum == right_sum
#   end
#   -1
# end

# Second solution

# def find_even_index(arr)
#   left_sum = 0
#   right_sum = arr[1..-1].sum

#   arr.each_with_index do |value, i|

#     return i - 1 if left_sum == right_sum

#     if i != 0
#       left_sum += arr[i-1]
#       right_sum -= value
#     end
#   end
#   -1
# end

# Third solution

def find_even_index(arr, left_sum = 0, right_sum = 0)
  arr.each_with_index do |value, i|
    if i.zero?
      right_sum = arr[1..].sum
    else
      left_sum += arr[i - 1]
      right_sum -= value
    end
    return i if left_sum == right_sum
  end
  -1
end

# Shorter solution but slower for larger array
def find_even_index_2(array)
  array.each_with_index do |number, index|
    return index if array[0...index].sum == array[index + 1..-1].sum

    return -1 if index == array.size - 1
  end
end

puts 'Array of 7 numbers'
puts 'Solution with sum in memory'
puts Benchmark.measure {
  puts find_even_index([1,2,3,4,3,2,1]) # expect 3
}
puts 'Solution with sum recalculated at every index'
puts Benchmark.measure {
  puts find_even_index_2([1,2,3,4,3,2,1]) # expect 3
}
# puts find_even_index([1,100,50,-51,1,1]) # expect 1
puts '---------------'
puts 'Array of 100 numbers'
puts 'Solution with sum in memory'
puts Benchmark.measure {
  puts find_even_index(Array(-100..-1)) # expect -1
}
puts 'Solution with sum recalculated at every index'
puts Benchmark.measure {
  puts find_even_index_2(Array(-100..-1)) # expect -1
}
# puts find_even_index([0,0,0,0,0]) # expect 0
