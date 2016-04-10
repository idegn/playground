factrials = [1, 1]

(2..9).each do |i|
  factrials[i] = factrials[i-1]*i
end

# p factrials

LIMIT = 2540160
p (3..LIMIT).select { |n|
  n == n.to_s.chars.map(&:to_i).reduce(0) { |acc, i| 
    acc += factrials[i]
  }
}.reduce(&:+)

# research
# x = 0
# limit = 0
# count = 1
# while x <= limit
#   limit = factrials[9]*count
#   x = (x*10) + 9
#   count += 1
# end
# p [count,x,limit]

# p (1..Float::INFINITY).find { |count| 
#   factrials[9]*count < ("9"*count).to_i 
# }
