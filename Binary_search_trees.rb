class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
  attr_accessor :root
  def initialize(array)
    new_array = array.uniq.sort
    @root = build_tree(new_array)
  end

  def build_tree(array)
    return nil if array.empty?

    middle = array.length/2
    node = Node.new(array[middle])

    node.left = build_tree(array[0...middle])
    node.right = build_tree(array[middle+1...array.length])

    node
  end

  def insert(key, node = @root)
    if key == node.data
      return node
    elsif node.data < key
      node.right = Node.new(key) if node.right.nil?
      insert(key, node.right)
    else
      node.left = Node.new(key) if node.left.nil?
      insert(key, node.left)
    end
  end

  def delete_leaf(key, node = @root)
    #delete 1 leaf or branch with one branch

    if !node.left.nil? && key == node.left.data
      return node.left.left.nil? ? node.left = node.left.right : node.left = node.left.left
    elsif key == node.right.data
      return node.right.right.nil? ? node.right = node.right.left : node.right = node.right.right
    else
      if node.data < key
        delete_leaf(key, node.right)
      elsif node.data > key
        delete_leaf(key, node.left)
      end
    end
  end

  def delete_two_child(key, node = @root, current_node = @root)
    #branch with 2 child
    if node.data == key
      current_node = node.right
      until current_node.left == nil
        current_node = current_node.left
      end
      temp = current_node.data
      delete_leaf(current_node.data)
      node.data = temp
    else
      if node.data < key
        delete_two_child(key, node.right)
      elsif node.data > key
        delete_two_child(key, node.left)
      end
    end
  end

  def delete(key)
      node = find(key)
      return puts "In Tree no node #{key}" if node.nil?
      node.left == nil || node.right == nil ? delete_leaf(key) : delete_two_child(key)
  end

  def find(value, node = @root)
    return node if node.nil? || node.data == value

    value < node.data ? find(value, node.left) : find(value, node.right)
  end

  def level_order(node = @root)
    queue = []
    queue.push(node)
    until queue.empty?
      node = queue.shift
      print "#{node.data} "
      queue.push(node.left) if !node.left.nil?
      queue.push(node.right) if !node.right.nil?
    end
  end

  def preorder(node = @root, mas = [])
    return node if node.nil?
    mas.push(node.data)
    preorder(node.left, mas)
    preorder(node.right, mas)
    mas
  end

  def inorder(node = @root, mas = [])
    return node if node.nil?
    inorder(node.left, mas)
    mas.push(node.data)
    inorder(node.right, mas)
    mas
  end

  def postorder(node = @root, mas = [])
    return node if node.nil?
    postorder(node.left, mas)
    postorder(node.right, mas)
    mas.push(node.data)
    mas
  end

  def height(value = 0, node = @root, count = -1)
    return count if node.nil?

    node = find(value) if value !=0
    count += 1
    [height(0, node.left, count), height(0, node.right, count)].max
  end

  def depth(value, node = @root, count = 0)
    return count if node.nil? || node.data == value

    count += 1
    value < node.data ? depth(value, node.left, count) : depth(value, node.right, count)
  end

  def balanced?(node = @root)
    return true if node.left.nil? && node.right.nil?

    if height(node.data) > 1 && (node.left.nil? || node.right.nil?)
      return false
    elsif height(node.data) == 1 && (node.left.nil? || node.right.nil?)
      return true
    end

    (height(node.right.data) - height(node.left.data)).abs <= 1 && balanced?(node.right) && balanced?(node.left) ? true : false
  end

  def rebalance
    @root = build_tree(inorder.uniq.sort)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

array = Array.new(15){ rand(1..100) }
#array = [4,8,6,2,1,7,5,3]
print array.sort
puts
tree = Tree.new(array)
tree.pretty_print
puts "Tree is balanced? #{tree.balanced?}"
print "Preorder :#{tree.preorder} \n"
print "Postorder :#{tree.postorder} \n"
print "Inorder :#{tree.inorder} \n"
tree.insert(200)
tree.insert(101)
tree.insert(110)
tree.pretty_print
puts "Tree is balanced? #{tree.balanced?}"
puts "Balance"
tree.rebalance
tree.pretty_print
puts "Tree is balanced? #{tree.balanced?}"



