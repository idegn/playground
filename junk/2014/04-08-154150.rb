#euler 9
class Array
  def pita
    a,b,c = self

    return a*a + b*b == c*c
  end
end

1.upto(1000) do |a|
  (a+1).upto(1000) do |b|
    c = 1000 - a - b
    break if c < b
    if [a,b,c].pita
      puts a*b*c
      exit
    end
  end
end
