# -*- coding: utf-8 -*-
#東大　院試 2013-8

#(1)
def dp_r0(d)  
  one_d = (10/d.abs).floor + 1
  one_d * one_d
end

# puts dp_r0 1
# puts dp_r0 2.5

#(2)
def dp_r1(d)
  t = (10/d.abs).floor
  
  (0..t).map{ |i|
    (0..t).select { |j|
      x = d*i
      y = d*j
      (x - 5)**2 + (y - 5)**2 <= 25
      }
  }.flatten.count
end

def pro3(d)
  (dp_r1(d)*dp_r0(d))/4
end

print "pro3"
puts pro3 1.1

#リファクタ
def dp(range, d) #範囲を原点からの正方形で指定できるやつのみ
  t = (range/d.abs).floor

  (0..t).map { |i|
    (0..t).select { |j|
      yield(d*i,d*j)
    }
  }.flatten.count
end

print "dp0:"
p dp(10, 1) {|x,y|
  (0..10).include? x and (0..10).include? y
}
print "dp1:"
p dp(10, 1.1) {|x,y|
  (x - 5)**2 + (y - 5)**2 <= 25
}
print "dp_r1:"
puts dp_r1(1.1)

#(3)(4)
def cal_reg_tri_area(len)
  ((len**2) * Math.sqrt(3))/4
end


def calK(n)
  e_len = 10
  area = cal_reg_tri_area(e_len)

  e_num = 3
  (n-1).times do
    e_len /= 3

    area += e_num * cal_reg_tri_area(e_len)

    e_num *= 4
  end

  area
end

p calK(2)
