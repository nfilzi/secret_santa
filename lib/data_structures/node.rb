class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data      = data
    @next_node = next_node
  end

  def to_s
    "#{data} -> #{next_node.data}\n"
  end
end
