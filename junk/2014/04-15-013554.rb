# def hoge(count)
#   ->{count+=1}  
# end
# a = hoge(0)

hoge = ->(num){ ->{num += 1}}
a = hoge.(0)
5.times do
  a.call
end

p a.call
