class SquareRootConvergents
  attr_reader :numerator, :denominator
  def initialize
    @numerator = 3
    @denominator = 2
  end

  def next_iteration!
    tmp = @numerator + @denominator
    @numerator = tmp + @denominator
    @denominator = tmp
  end

  def to_s
    @numerator.to_s + "/" + @denominator.to_s
  end

  def same_digits?
    @numerator.to_s.chars.count == @denominator.to_s.chars.count
  end
end

N = 1000
approx = SquareRootConvergents.new
count = 0

N.times do 
  count += 1 unless approx.same_digits?
  approx.next_iteration!  
end

p count
