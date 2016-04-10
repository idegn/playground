#algorithm p61
class BSTree

  class Node
    def initialize(key,data)
      @key = key
      @data = data
      @left = nil
      @right = nil
    end
    attr_accessor :key,:data, :left, :right
  end

  def initialize(key,data)
    @root = Node.new(key,data)
  end

  def search(key)
    t = @root
    while t
      if t.key == key
        return t
      elsif t.key < key
        t = t.right
      else
        t = t.left
      end
    end
    return nil
  end
  
  def insert!(key,data,node = @root)
    if node == nil
      return Node.new(key,data)
    elsif node.key == key
      node.data = data
    elsif node.key < key
      node.right = insert!(key,data,node.right)
    else
      node.left = insert!(key,data,node.left)
    end
    node
  end

  
  def pnt(node = @root)
    print node.key, ":", node.data, "\n"
    print "right.key:",node.right.key, "\n" if node.right
    print "left.key:",node.left.key, "\n" if node.left
    pnt(node.right) if node.right
    pnt(node.left) if node.left
  end

  def delete!(key, node = @root)
    data = nil
    if node
      if key == node.key
        if node.left.nil?
          return node.left, data
        elsif node.right.nil?
          return node.left, data
        else
          t = node.left
          t = node.right while t.right
          node.key,node.data = t.key,t.data
          node.left,data = delete!(t.key,node.left)
        end
      elsif key < node.key
        node.left, data = delete!(key,node.left)
      else
        node.right, data = delete!(key,node.right)
      end
    end
    return node,data
  end

end

bst =  BSTree.new(:a ,0)

arg = {e: 1, d: 2, f: 3, c: 4, g: 5}

arg.each do |key,value|
  bst.insert!(key,value)
end

bst.pnt

puts
#bst.delete! :e
#bst.delete! :c
bst.delete! :d
bst.pnt

