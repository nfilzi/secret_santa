class CircularLinkedList
  include Enumerable
  attr_accessor :head

  def self.build(elements)
    list = new
    elements.each { |element| list.insert(element) }
    return list
  end

  def insert(data)
    new_node = Node.new(data)
    if !@head
      new_node.next_node = new_node
      @head = new_node
    else
      new_node.next_node = @head.next_node
      @head.next_node = new_node
      @head.data, new_node.data = new_node.data, @head.data
    end
  end

  def each
    node = @head
    while node
      yield node
      node = node.next_node
      break if node == @head
    end
  end
end
