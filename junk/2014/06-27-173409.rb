def rshift(s)
  [0] + s[0..-2]
end

def sm(s,t)
  res = "0000000000000000000000000000000000000000000000000000000000000000".chars.map(&:to_i)

  (s.length-1).times do |i|
    co = 0
    res[i] += s[i] + t[i]

    if res[i] > 9
      res[i] -= 10
      co = 1
    end
    res[i+1] += co
  end

  res[-1] += s[-1] + t[-1]
  SystemExit.new(1, "sum:overflow.") if res[-1] > 9
  
  res
end

def mul_inner(s,k)
  res = "0000000000000000000000000000000000000000000000000000000000000000".chars.map(&:to_i)

  (s.length-1).times do |i|
    co = 0
    tmp = s[i] * k + res[i]
    
    co = tmp / 10 if tmp > 9
    res[i] = tmp%10

    res[i+1] += co    
  end

  res[-1] += s[-1] * k  
  SystemExit.new(1, "mul_inner:overflow.") if res[-1] > 9

  res
end

def mul(s, se, t, te)
  res = "0000000000000000000000000000000000000000000000000000000000000000".chars.map(&:to_i)
  s = s + "00000000000000000000000000000000".chars.map(&:to_i)

  t.each do |c|
    #p res 
    res = sm(mul_inner(s,c.ord), res) if c != 0
    s = rshift(s)
  end
  res
end

s = "12345678901234567890123456789012".chars.map(&:to_i).reverse
se = 4
t = "98765432109876543210987654321098".chars.map(&:to_i).reverse
te = 9

p mul(s,se, t, te).length
puts mul(s,se, t, te).reverse[0,31].join
puts se+te+1
