def longest_palindrome(string)
  total_length = string.length
  return 0 if total_length == 0

  palindrome_length = 1
  number = 2
  array = string.split('')
  while number <= total_length do
    require 'pry'; binding.pry
    array.each_cons(number) do |element|
      length = element.length
      palindrome_length = length if element == element.reverse && length > palindrome_length
    end
    number += 1
  end
  palindrome_length
end

p longest_palindrome("catacl")

# look at every substring with 2 characters
# check if it is a palindrome
# check if the palindrome is longer than the previously-found palindrome (word)
#...
#return the highest value for palindrome length