class LinkedList
    def initialize
        @head = nil
    end

    def append(value)
        if @head == nil
            @head = Node.new(value, nil)
        else
            tail.next_node= Node.new(value, nil)
        end
    end

    def prepend(value)
        @head = Node.new(value, @head)
    end

    def size
        count = 0
        self.each { count += 1 }
        count
    end 

    def each
        current = @head
        until current == nil do
            yield(current)
            current = current.next_node
        end
    end

    def tail
        return nil if @head == nil
        current = @head
        until current.next_node == nil do
            current = current.next_node
        end
        current
    end

    def head
        @head
    end

    def at(index)
        curr_index = 0
        self.each do |node|
            return node if curr_index == index
            curr_index += 1
        end
    end                

    def pop
        if size == 1
            @head = nil
        else
            at(size - 2).next_node = nil
        end
    end

    def contains?(data)
        self.each {|node| return true if node.value == data }
        return false
    end

    def find(value)
        current = @head
        index = 0
        until current == nil do
            return index if current.value == value
            index += 1
            current = current.next_node
        end
    end

    def to_s
        result = ""
        self.each {|node| result << "( #{node.value} ) -> " }
        return result + "nil"
    end
end

class Node
    attr_accessor :value, :next_node

    def initialize(val = nil, next_node = nil)
        @value = val
        @next_node = nil
    end
end