def f (x)
  ->{
  x += 8
  }
end

result = f(5)
p result.call
p result.call

puts :hoge


