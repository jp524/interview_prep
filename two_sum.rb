# Write a function that takes an array of numbers and a target number.
# It should find two different items in the array that, when added together, give the target value.
# The indices of these items should then be returned in an array like so: [index1, index2].

# For the purposes of this kata, some tests may have multiple answers; any valid solutions will be accepted.

# The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will be numbers;
# target will always be the sum of two different items from that array).


def two_sum(numbers, target)
  last_index = (numbers.count) - 1
  index_1 = 0
  index_2 = 1

  until index_1 == last_index
    while index_2 <= last_index
        return [index_1, index_2] if (numbers[index_1] + numbers[index_2]) == target
        index_2 += 1
    end
      index_1 += 1
      index_2 = index_1 + 1
  end
end

p two_sum([1, 2, 3], 4)  #[0, 2]
p two_sum([1234, 5678, 9012], 14690) #[1, 2]
p two_sum([2, 2, 3], 4) #[0, 1]
