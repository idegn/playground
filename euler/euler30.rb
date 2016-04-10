MAX = (9 ** 5) * 5

memo = Array.new(10) { |i| i ** 5 }

p (2..MAX).select { |num|
  num == num.to_s.chars.map(&:to_i).inject(0) { |acc, i| acc += memo[i] }
}.tap { |i| p i }.inject(&:+) 
