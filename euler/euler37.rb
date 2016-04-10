require 'prime'

ans = []

# (10..Float::INFINITY).find { |i|
#   next unless Prime.prime?(i)
#   t = i.to_s.chars
#   if (0...(t.count-1)).all? { |n|
#       a = t[0..n].join.to_i
#       b = t[(n+1)...t.count].join.to_i
#       Prime.prime?(a) and Prime.prime?(b)
#     }
#     ans << i
#   end
#   ans.count == 11
# }
# p ans.reduce(&:+)

choices = [1, 2, 3, 5, 7, 9]

(2..Float::INFINITY).find { |len|
  choices.repeated_permutation(len).each do |i|    
    i = i.join.to_i
    next unless Prime.prime?(i)
    t = i.to_s.chars
    if (0...(t.count-1)).all? { |n|
        a = t[0..n].join.to_i
        b = t[(n+1)...t.count].join.to_i
        Prime.prime?(a) and Prime.prime?(b)
      }
      ans << i
    end
  end
  ans.count == 11
}
p ans.reduce(&:+)

