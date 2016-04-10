#algorithm p70 AVL tree
class AVLTree
  class Node
    def initialize(key,data,parent)
      @key = key
      @data = data
      @parent = parent
      @left = nil
      @right = nil
      @balance = 0
    end
    attr_accessor :key, :data, :parent, :left, :right
  end

  def initialize(key,data)
    @root = Node.new(key,data,nil)
  end

  def pnt(node = @root)
    print node.key, ":", node.data, "\n"
    print node.key,".right.key:", node.right.key, "\n" if node.right
    print node.key,".left.key:", node.left.key, "\n" if node.left
    pnt(node.right) if node.right
    pnt(node.left) if node.left
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


  def insert_wrap!(key,data)
    insert!(key,data)
    balance(key)
  end
  
  def balance(key)
    t = @root
    p = Array.new
    while t
      if t.key == key
        break
      elsif t.key < key          
        t = t.right
        p.push :r
      else
        t = t.left
        p.push :l
      end
    end
    p p

    while t.parent
      t = t.parent      
      e = p.pop
      if e == :r
        if t.balance == -1
          t.balance = 0
          break
        elsif t.balance == 0
          t.balance = 1
        else
          if t.right.balance == 1
            single_left_rotation(t,e)
            break
          else
            
          end
        end
      else #left up
        
      end      
    end
  end
  
  def insert!(key,data, node = @root, parent = nil)
    if node == nil      
      return Node.new(key,data,parent)
    elsif node.key == key
      node.data = data
    elsif node.key < key
      node.right = insert!(key, data, node.right, node)      
    else
      node.left = insert!(key, data, node.left, node)
    end
    node
  end
  
  def delete!(key, node = @root)
  end

  private
  def single_left_rotation(t,e)
    if e == :r
      t.parent.right = t.right
    else
      t.parent.left = t.right
    end
    t.right.parent = t.parent
    
    t.parent = t.right
    
    t.right = t.right.left
    t.right.parent = t

    t.parent.left = t
    
    t.balance = t.parent.balance = 0
  end

  
end

avl = AVLTree.new(:a, 0)

arg = {e: 1, d: 2, f: 3, c: 4, g: 5}

arg.each do |key,value|
  avl.insert!(key,value)
  puts
  avl.pnt
end

avl.balance(:g)
