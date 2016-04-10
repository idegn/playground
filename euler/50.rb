require 'prime'

#愚直
LIMIT = 1_000_000
N = 4_000 #2秒弱
#N = 1_000_000 #7秒

primes = Prime.each(N).to_a

provisional = [2, 1]
primes.each_with_index do |i, idx|
  sum = i  
  count = 1
  
  primes[(idx+1)..-1].each do |j|
    sum += j
    count += 1
    break if sum >= LIMIT
    provisional = [sum, count] if Prime.prime?(sum) and count > provisional[1]
  end
end

puts "answer: #{provisional}"
