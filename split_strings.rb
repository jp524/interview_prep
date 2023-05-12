#  https://www.codewars.com/kata/515de9ae9dcfc28eb6000001

def solution(str)
  str.concat("_") if str.length.odd?
  str.chars.each_slice(2).map(&:join)
end

def solution(str)
  str.concat("_") if str.length.odd?
  str.scan(/\w{2}/)
end

p solution("abcdef") # ["ab", "cd", "ef"]
p solution("abcdefg") # ["ab", "cd", "ef", "g_"]
p solution("") # []