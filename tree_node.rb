class TreeNode
  attr_accessor :value, :parent
  attr_reader :left, :right

  def initialize(value)
    @value, @parent = value, nil
  end

  def left=(child)
    child.parent = self
    @left.parent = nil if @left
    @left = child
  end

  def right=(child)
    child.parent = self
    @right.parent = nil if @right
    @right = child
  end

  def bfs(destination)
    nodes = [self]
    found = false
    result = nil

    until found
      nodes << nodes[0].left
      nodes << nodes[0].right
      nodes.shift
      if nodes.any? { |node| node.value == destination }
        result = nodes.select { |node| node.value == destination}
        found = true
      end
    end

    get_chain(result[0])
  end

  def get_chain(result)
    parent_chain = []
    parent_chain << result.value
    if result.parent == nil
      # do nothing
    else
      parent_chain += get_chain(result.parent)
    end
    parent_chain.reverse
  end
end