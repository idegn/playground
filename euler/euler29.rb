#愚直試したら余裕で終わらない
#range = Array(2..100)
#p range.reduce([]) { |ans, a|
#  range.each do |b|
#    ans << a ** b
#  end
#}.uniq.count

#def factors(num)
#  square_root_of_num = Math.sqrt(num)
#  ans = (2..square_root_of_num).select { |i| num % i == 0 }
#  ans += ans.map { |i| num / i }
#  ans += [1]
#  ans.uniq
#end
#
#(0..20).each do |i|
#  p [i, factors(i)]
#end

require 'set', 'prime'
range = Array(2..100)

set = Set.new
range.each do |a|
  prime_factor = Prime.prime_division(a)
  range.each do |i|
    set << prime_factor.map { |(x, y)| [x, y * i] } 
  end
end
p set.count
