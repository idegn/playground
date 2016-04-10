#euler 21
# tmp = 220
# square_root_of_tmp = (tmp ** 0.5).to_i

# p ans = (2..square_root_of_tmp).select{|x| tmp%x == 0}
# p ans += ans.map{|x| tmp/x }
# p ans += [1]
# p ans = ans.uniq
# p ans.reduce(&:+)

def divisors(num)
  square_root_of_num = (num ** 0.5).to_i

  ans = (2..square_root_of_num).select{ |x| num%x == 0 }
  ans += ans.map{ |x| num/x }
  ans.uniq + [1]
end

def sum_of_divisors(num)
  divisors(num).reduce(&:+)
end

$memo = []
def is_amicable_number?(a)
  $memo[a] = sum_of_divisors(a) if $memo[a].nil?
  b = $memo[a]
  return false if a == b
  
  $memo[b] = sum_of_divisors(b) if $memo[b].nil?
  a == $memo[b]    
end

p (1...10000).select{ |x| is_amicable_number?(x) }.reduce(&:+)

# memo = []
# p (1...10000).reduce([]) { |ans, a|
#   memo[a] = sum_of_divisors(a) if memo[a].nil?
#   b = memo[a]
#   if a != b
#     memo[b] = sum_of_divisors(b) if memo[b].nil?
#     ans += [a,b] if a == memo[b]    
#   end
#   ans
# }.uniq.reduce(&:+)

# p (1...10000).reduce([]) { |ans, a|
#   b = sum_of_divisors(a)
#   if a != b
#     tmp = sum_of_divisors(b) 
#     ans += [a,b] if a == tmp
#   end
#   ans
# }.uniq.reduce(&:+)

