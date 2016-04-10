#euler 16
n = 2**1000
ans = 0
until n == 0 do
  ans += n%10
  n /= 10
end
p ans
