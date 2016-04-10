require 'prime'

# なんとかテレスのふるい使わないと最初の素数判定糞遅い
# p choices = (2...1_000_000).select { |n| 
#   Prime.prime?(n) }.select { |n|
#     count = (1..Float::INFINITY).find { |i|
#       (n / (10 ** i)).zero?
#     }
#     n_arr = n.to_s.chars
#     (1..count).all? { |i| Prime.prime?(n_arr.rotate(i).join.to_i) }
#   }.count
# 
# p choices.count

# なんとかテレス版＋後ろの判定もmemo利用
LIMIT = 1_000_000
memo = Array.new(LIMIT, true)
p choices = (2...LIMIT).select { |n| 
  next false unless memo[n]
  (2..Float::INFINITY).find { |i|
    memo[i*n] = false
    LIMIT < i*n
  }
  true
}.select { |n|
    count = (1..Float::INFINITY).find { |i|
      (n / (10 ** i)).zero?
    }
    n_arr = n.to_s.chars
    (1..count).all? { |i| memo[n_arr.rotate(i).join.to_i] }
  }.count
