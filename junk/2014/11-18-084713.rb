#euler 20
x = (1..100).inject(&:*)
ans = 0
until x == 0 do
  ans += x % 10
  x /= 10
end
puts ans
