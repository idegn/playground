def is_pentagonal?(num)
  n = (1 + Math.sqrt(1 + 24*num)) / 6
  n == n.to_i
end

def is_hexagonal?(num)
  n = (1 + Math.sqrt(1 + 8*num)) / 4
  n == n.to_i
end

#六角数は三角数のサブセットだから三角数判定いらないっぽい
ans = nil
i = 2
until ans
  t = (i * (i + 1 )) / 2
  ans = t if is_pentagonal?(t) and is_hexagonal?(t) and t != 40755
  i += 1
end

p ans
