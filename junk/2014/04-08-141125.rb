#algorithm p47
class Queue

  class Node
    def initialize(data, front, back)    
      @data = data
      @front = front
      @back = back    
    end
    attr_accessor :data, :front, :back
  end

  def initialize
    @head = Node.new(nil,nil,nil)
    @tail = @head
  end
  
  def enque(data)
    @tail.back = Node.new(data, @tail, nil)
    @tail = @tail.back
    @tail.data
  end

  def deque
    unless empty?
      rtn = @head.back.data
      @head.back = @head.back.back        
      rtn
    else
      @tail = @head
    end
  end

  def empty?
    @head.back.nil?
  end

  def peek
    @head.back.data
  end

  def pnt
    tmp = @head.back
    until tmp.nil?
      print tmp.data.to_s + " "
      tmp = tmp.back
    end
    puts
  end
end

q = Queue.new


q.enque 1
q.pnt

q.enque 2
q.pnt


q.enque 3
q.enque 4
q.enque 5
q.pnt

q.deque
q.pnt

q.deque
puts q.peek
q.deque
puts q.peek
q.deque
puts q.peek

q.deque
q.deque
q.deque
q.deque
q.deque
q.pnt

q.enque 1
q.enque 2
q.enque 3
q.enque 4
q.pnt

