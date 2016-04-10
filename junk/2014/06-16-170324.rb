# p [1,3,5,7].tap{ |x|
#   x.each {|i| puts "hoge:#{i}"}
# }

# x = 3

f = ->(y){ ->{y = y + 1}}

c = f[0]
p c[]
p c[]
p c[]


#p [1,3,5,7].instance_eval {|x| x.count  }
# [1,3,5,7].instance_eval {
#   |x| puts x.count  
#   puts self.count
# }  
