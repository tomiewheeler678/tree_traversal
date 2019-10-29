class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end

class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
    @queue = MyQueue.new
  end


  def depth_first(node, find_value)
    #node = self
    if node.payload == find_value
     puts "exit condition met"
      return node
    else
      node.children.each do |child|
      puts node.payload
      depth_first(child, find_value)
    end
    end
  end
    
  def breadth_first(node, find_value)
    #node = self
    while node
      if node.payload == find_value
        puts "exit condition met"
        return node
      else
        node.children.each do |child|
        puts node.payload
          @queue.enqueue(child)
        end
      end
      node = @queue.dequeue
    end
  end
end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])

puts "Depth First:"
trunk.depth_first(trunk, 11)
puts "Breadth First:"
trunk.breadth_first(trunk, 11)
