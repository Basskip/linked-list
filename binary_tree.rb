class Node
    attr_accessor :value, :left_child, :right_child
    
    def initialize(value = nil, left_child = nil, right_child = nil)
        @value = value
        @left_child = left_child
        @right_child = right_child
    end
end

def build_tree(array)
    root = Node.new(array.shift)
    puts root

    array.each do |item|
        place_value(item, root)
    end
    return root
end

def place_value(value, root)
    if value >= root.value
        if root.right_child == nil
            root.right_child = Node.new(value)
        else
            place_value(value, root.right_child)
        end
    elsif value < root.value
        if root.left_child == nil
            root.left_child = Node.new(value)
        else
            place_value(value, root.left_child)
        end
    end
end

def breadth_first_search(value, root)
    queue = []
    queue << root

    until (queue.empty?) do
        current = queue.shift
        return current if current.value = value
        queue << current.left_child if current.left_child 
        queue << current.right_child if current.right_child 
    end
end

def depth_first_search(value, root)
    stack = []
    stack << root
    until stack.empty? do
        current = stack.pop
        return current if current.value = value
        stack << current.right_child if current.right_child
        stack << current.left_child if current.left_child
    end
end

def dfs_rec(value, root)
    return root if root.value == value
    dfs_rec(value, root.left_child) if root.left_child
    dfs_rec(value, right.right_child) if root.right_child
end