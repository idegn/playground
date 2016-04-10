require 'prime'

(2..9).to_a.reverse.find { |n|
  p (1..n).to_a.permutation(n).map { |arr| arr.join.to_i }.sort.reverse.find { |i| Prime.prime? i }
  # tmp = (1..n).to_a.permutation(n).map { |arr| arr.join.to_i }.select { |i| Prime.prime? i}
  # p tmp.max unless tmp.nil?
}
