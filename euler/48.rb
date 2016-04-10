def self_power(n)
  n ** n
end

RANGE = 1..1000
#RANGE = 1..10

puts RANGE.reduce { |acc, i| acc + self_power(i) }.to_s[-10..-1]
# p RANGE.map(&method(:self_power)).reduce(:+)



