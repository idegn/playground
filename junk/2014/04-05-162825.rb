#algorithm p36
class List
  attr_accessor :data,:nxt
  def initialize(data, nxt = nil)
    @data = data
    @nxt = nxt
  end

  def nth(n)
    t = self
    n.times do
      if t.nxt == nil
        p "not exist"
        break
      end
      t = t.nxt
    end
    t
  end

  def at(n)
    self.nth(n).data
  end

  def insert(n, data)
    t = self.nth(n-1)
    t.nxt = List.new(data, t.nxt)
  end

  def delete(n)
    t = self.nth(n-1)    
    t.nxt = t.nxt.nxt
  end

  def empty
    if self.nxt == nil
      true
    else
      false
    end
  end

  def show
    t = self
    while t.nxt != nil
      print t.data.to_s + " "
      t = t.nxt
    end
    puts t.data
  end
end

#############

head = List.new(0)
head.nxt = List.new(1)
tmp = head.nxt
head.nxt = List.new(2, tmp)
tmp = head.nxt
head.nxt = List.new(3, tmp)

head.show

head.nth(2).data = 5

head.show

#p head.nth(1).data
p head.at(2)

puts ""
head.insert(2, 7)

head.show

head.delete(2)

head.show

p head.empty

hoge =  List.new(100)
p hoge.empty
