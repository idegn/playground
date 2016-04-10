LIMIT = 1_000_000
#LIMIT = 1_000

def is_palindrome?(str)
  (1..(str.count/2)).all? { |i| str[i-1] == str[-i] }
end

p (1...LIMIT).select { |n| is_palindrome?(n.to_s.chars) and is_palindrome?(n.to_s(2).chars) }.reduce(&:+)
