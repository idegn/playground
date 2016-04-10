MAX = 1_000_000.freeze
getas = [0]
targets = [1, 10, 100, 1_000, 10_000, 100_000, 1_000_000]

#案1
# d = []

# count = 0
# pre_count = 0
# pre_digit = 1
# digit_number = 1
# targets.each do |target|
#   getas << 10 ** pre_digit if getas[pre_digit].nil?

#   while count < target
#     pre_count = count
#     count += 9 * (10 ** (digit_number - 1)) * digit_number
#     pre_digit = digit_number
#     digit_number += 1    
#   end
  
#     margin = target - pre_count
#     quotient = margin / pre_digit
#     surplus = margin % pre_digit
#     d << (getas[pre_digit-1] + quotient).to_s.chars[surplus - 1].to_i
# end

# p d, d.reduce(:*)

#案2
# str = ""
# (1..Float::INFINITY).find do |i|
#   str += i.to_s
#   1_000_000 < str.length
# end

# p targets.reduce([]) { |acc,target| acc << str[target-1]}.map(&:to_i).reduce(:*)

#案3
ranges = [0]
digit_number = 1
d = []
while ranges[-1] < MAX
  ranges << ((10 ** digit_number) - (10 ** (digit_number - 1))) * digit_number + ranges[-1]
  digit_number += 1
end

targets.map do |target|
  #_, digit_number = ranges.each_with_index.find { |range, _| target < range }
  _, digit_number = ranges.each_with_index.to_a.bsearch { |range, _| target < range }
  
  margin = target - ranges[digit_number - 1]
  quotient = margin / digit_number
  surplus = margin % digit_number
  
  getas << 10 ** digit_number if getas[digit_number].nil?
  d << (getas[digit_number - 1] + quotient).to_s.chars[surplus - 1].to_i
end
p d.reduce(:*)
