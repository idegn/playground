#15秒かかる，多分primeが遅い
require 'prime'

class SpiralSquare
  def initialize
    @side_length = 1

    @count = 0
  end

  def next_length!
    i = @side_length ** 2
    @side_length += 2
    
    4.times do
      i += @side_length - 1
      @count += 1 if Prime.prime? i
    end

    @ratio_of_primes = @count.to_f / ((@side_length / 2) * 4 + 1)
  end

  attr_reader :count, :ratio_of_primes, :side_length
end

ss = SpiralSquare.new
(1..Float::INFINITY).find do
  ss.next_length!
  ss.ratio_of_primes < 0.10
end
p ss.side_length
