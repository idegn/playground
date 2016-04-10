# n(n+a) + b
require 'prime'
primes = [1] + (2...1000).select { |i| Prime.prime?(i) }
primes = [1] + Prime.each(1000).to_a
#primes = (-999...1000)
primes = primes[1..-1].reverse.map { |i| i * -1 } + primes

max = 0
ans = []
primes.each do |b|
  primes.each do |a|
    count = 0
    (0...b).each do |n|
      if Prime.prime?(n * (n + a) + b) 
        count += 1
      else
        break
      end
    end
    if max < count
      max = count
      ans = [a,b]
    end
  end
end

p ans
