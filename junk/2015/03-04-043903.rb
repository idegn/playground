#euler 25
n = 1
999.times do 
  n = n*10
end
THOUSAND_FIGURE = n

def accept?(n)
  (n/THOUSAND_FIGURE) != 0
end

f = 1
fp = 1
ans = 2
until accept?(fp) do
  f,fp = fp,f
  fp += f
  ans += 1
end
p ans

