# https://www.codewars.com/kata/573992c724fc289553000e95

def smallest(n)
  number = n.digits.reverse

  smallest_number = n
  solution = [smallest_number, 0, 0]

  number.each_index do |i|
    (0..number.length + 1).each do |j|
      number_copy = number.clone
      new_number = number_copy.insert(j, number_copy.delete_at(i)).join.to_i
      if new_number < smallest_number
        solution = [new_number, i, j]
        smallest_number = new_number
      end
    end
  end

  solution
end

# p smallest(261235) #[126235, 2, 0]
# p smallest(209917) #[29917, 0, 1]
# p smallest(285365) #[238565, 3, 1]
# p smallest(269045) #[26945, 3, 0]
# p smallest(296837) #[239687, 4, 1]
