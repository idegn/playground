class Integer
  def reverse_add
    self + self.to_s.reverse.to_i
  end

  def palindromic?
    self.to_s == self.to_s.reverse
  end
    
  def lychrel?
    num = self
    50.times do
      num = num.reverse_add
      return false if num.palindromic?
    end
    true
  end  
end

N = 10000
p (1...N).select { |i| i.lychrel? }.count
