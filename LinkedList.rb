class Node
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  #attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
    @count = 0
  end

  def append(value)
    @count+=1
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(value)
    @count+=1
    new_node = Node.new(value,@head)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @head = new_node
    end
  end

  def size
    @count
  end

  def head
    puts "First node in the list: #{@head.value}"
  end

  def tail
    puts "Last node in the list: #{@tail.value}"
  end

  def at(index)
    current_node = @head
    i = 1
    until i == index
      current_node = current_node.next_node
      i += 1
      if current_node == nil
        return "Here is only #{i} nodes"
      end
    end
    current_node.value
  end

  def pop
    current_node = @head
    value = @tail.value
    until current_node.next_node == @tail
      current_node = current_node.next_node
    end
    @tail = current_node
    @tail.next_node = nil
    puts "Node #{value} was deleted"
  end

  def contains?(value)
    true_or_false = false
    current_node = @head
    until current_node == @tail
      if current_node.value == value
        true_or_false = true
      end
      current_node = current_node.next_node
    end
    true_or_false
  end

  def find(value)
    current_node = @head
    i = 1
    index = 0
    until current_node.nil?
      if current_node.value == value
        index = i
      end
      current_node = current_node.next_node
      i+=1
    end
    index
  end

  def insert_at(value, index)
    @count+=1
    current = @head
    if index < 2
      return prepend(value)
    elsif index > @count
      return append(value)
    else
      (index - 2).times do
        current = current.next_node
      end
    end
    new_node = Node.new(value)
    if current.next_node != nil
      new_node.next_node = current.next_node
    end
    current.next_node = new_node
  end

  def remove_at(index)
    return puts 'Error: you selected an index outside of the list.' if index > size || index < 1

    i = 1
    node = @head
    if index == @count
      @count-=1
      return pop
    elsif index == 1
      @count-=1
      puts "Node #{@head.value} was deleted"
      @head = @head.next_node
    else
      until i == index - 1
        node = node.next_node
        i+=1
      end
      new = node.next_node
      puts "Node #{new.value} was deleted"
      node.next_node = node.next_node.next_node
    end
  end

  def to_s
    current_node = @head
    until current_node == @tail
      print "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end
    puts "(#{@tail.value}) -> nil"
  end
end

mylist = LinkedList.new
mylist.append(4)
mylist.append(12)
mylist.append(6)
mylist.append(7)
mylist.prepend(8)
mylist.size
mylist.head
mylist.tail
mylist.pop
mylist.tail
mylist.to_s
puts mylist.at(2)
p mylist.contains?(4)
p mylist.find(8)
mylist.insert_at(45,3)
mylist.to_s
mylist.remove_at(4)
mylist.to_s

