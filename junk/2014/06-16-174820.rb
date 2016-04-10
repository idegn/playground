#atcoder arc 2 b
y,m,d = gets.split("/").map(&:to_i)

def leap?(y)
  return true if y % 400 == 0
  return false if y % 100 == 0
  return true if y % 4 == 0
  return false
end

def div?(y,m,d)
  return false if y != (t = (y/m) * m)
  return false if t != (t/d) * d
  true
end

def next_day(y,m,d)
  cal = [0,31,28,31,30,31,30,31,31,30,31,30,31]
  cal[2] = 29 if leap? y

  if d == cal[m]
    y += 1 if m == 12
    
    m += 1
    m = 1 if m == 13
    
    d = 1
  else
    d += 1
  end
  return y,m,d
end

y,m,d = next_day(y,m,d) until div?(y,m,d)

#puts "#{y}/#{m}/#{d}"
puts sprintf("%d/%02d/%02d",y,m,d)
