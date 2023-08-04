# https://www.codewars.com/kata/54521e9ec8e60bc4de000d6c/train/ruby
# Finding the maximum sum of a contiguous subsequence in an arr or list of integers

require 'benchmark'

def max_sequence(arr)
  return 0 if arr.empty? || arr.all?(&:negative?)
  return arr.sum if arr.all?(&:positive?)

  (1...arr.length).reduce(0) do |max_sum, number|
    arr.each_cons(number) do |subarr|
      max_sum = [max_sum, subarr.sum].max
    end
    max_sum
  end
end

test_cases = [
  [], # 0
  [11, 2], # 13
  [-32], # 0
  [-2, 2, 2, 2], # 6
  [-2, 1, -7, 4, -10, 2, 1, 5, 4], # 12
  [-2, 1, -3, 4, -1, 2, 1, -5, 4] # 6
]

puts 'Original solution'
puts Benchmark.measure {
  test_cases.map { |arr| puts max_sequence(arr) }
}

def max_sequence_two(arr)
  return 0 if arr.empty? || arr.all?(&:negative?)

  max_so_far = arr[0]
  max_ending_here = arr[0]

  (1...arr.length).each do |i|
    max_ending_here = [max_ending_here + arr[i], arr[i]].max
    max_so_far = [max_so_far, max_ending_here].max
  end
  max_so_far
end

puts 'Another solution that is faster'
puts Benchmark.measure {
  test_cases.map { |arr| puts max_sequence_two(arr) }
}
