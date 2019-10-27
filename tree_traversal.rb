class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  def depth_first(find_value, node = nil)
    node ||= self
    if node.payload == find_value
      return node.payload
    else
      node.children.each do |child|
        payload = depth_first(find_value, child)
        return payload if payload == find_value
    end
  end
    
  def breadth_first(find_value, node = nil)
    wait = []
    wait.push(node)

    while wait.length != 0
      n = wait.shift
      return n if n.payload == find_value
      n.children.each do |child|
        wait.push(child)
    end
  end
end

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


queue = MyQueue.new

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)
puts queue.dequeue
queue.enqueue(6)
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue

# Outputs: 1, 2, 3, 4, 5, 6

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
depth_first(trunk, 11)
puts "Breadth First:"
breadth_first(trunk, 11)