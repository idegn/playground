#algorithm p52 heap
#n.floor

class Heap
  attr_reader :arr, :n
  
  def initialize(num = 20)
    @arr = Array.new(num)
    @n = 0
  end


  def insert(num)
    if @n < @arr.size
      @arr[@n] = num
      adjust(@n)
      @n += 1      
    end
  end

  def pop
    if 0 < @n
      k = 0
      max = @arr[k]
      @n -= 1
      @arr[k], @arr[@n] = @arr[@n],nil

      while k != (mi = max_ind(k))
        @arr[k],@arr[mi] = @arr[mi],@arr[k]
        k = mi
      end
      return max
    end
  end

  private
  def adjust(t)
    p = (t/2).floor
    while @arr[p] < @arr[t]
      @arr[p],@arr[t] = @arr[t],@arr[p]
      t = p
      p = (t/2).floor
    end
  end

  def max_ind(k)
    max = k
    l, r = 2*k+1, 2*k+2
    max = l if @arr[l] && @arr[max] < @arr[l]
    max = r if @arr[r] && @arr[max] < @arr[r]
    return max
  end
end



arg = [37,10,38,29,30,1,82,90,138]

h = Heap.new(20)

p h.arr
arg.each do |i|  
  h.insert i
#  p h.arr
end

p h.n
h.pop
puts 
p h.arr

h.pop
p h.arr

h.pop
h.pop
h.pop
h.pop
h.pop
h.pop
h.pop
h.pop
h.pop
p h.arr

arg.each do |i|  
  h.insert i
#  p h.arr
end

p h.arr
