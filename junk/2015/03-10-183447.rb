#euler 33
require 'prime'

denominator_range = (11..99)
p denominator_range.flat_map { |i| (10..(i-1)).map { |n| [n,i]} }.select { |(x, y)|
  a, b = [x, y].map { |n| n.to_s.chars }
  if a.any? { |n| b.include?(n) }
    ta = a.reject { |n| b.include?(n) }
    tb = b.reject { |n| a.include?(n) }
    if ta.empty? or tb.empty? or ((x % 10 == 0) and (y % 10 == 0))
      false
    else
      ta, tb = [ta, tb].flatten.map(&:to_i)
      tb.zero? ? false : Rational(ta,tb) == Rational(x,y)
    end
  else
    false
  end
}.reduce { |(x, y), (a, b)| [x*a, y*b]}.tap { |(a, b)| p Rational(a,b)}
