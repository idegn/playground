# -*- coding: utf-8 -*-
#algorithm p42
class Tree

  class Node
    def initialize(key,data)
      @key = key
      @data = data
      @left = nil
      @right = nil
    end
    attr_accessor :key, :data, :left, :right
  end

  
  def initialize      
    @root = nil
  end

  def search(node, key)
    while node
      if node.key == key
        return node
      elsif key < node.key
        node = node.left
       else
        node = node.right
      end
    end
  end

  def insert!(node, key, data)
    if node == nil
      return Node.new(key,data)
    elsif node.key == key
      node.data = data      
    elsif key < node.key
      node.left = insert!(node.left, key, data)
    else
      node.right = insert!(node.right, key, data)
    end
    node
  end

  def search_min(node)
    node = node.left while node.left
    node
  end

  def delete_min!(node)
    return node.right unless node.left #葉じゃなかった場合右の子を入れる
    node.left = delete_min!(node.left)
    node
  end
end
