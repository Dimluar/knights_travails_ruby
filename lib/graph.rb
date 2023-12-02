# frozen_string_literal: true

require_relative 'node'

# Graph data structure
class Graph
  attr_reader :nodes

  def initialize
    @nodes = {}
  end

  def add_node(value)
    @nodes[value] = Node.new(value) if nodes[value].nil?
  end

  def add_edge(value1, value2)
    nodes[value1].add_edge(value2)
    nodes[value2].add_edge(value1)
  end

  def level_order(value, queue = [], visited = [])
    return if nodes[value].nil?

    queue.unshift(value)
    visited << value
    until queue.empty?
      node = nodes[queue.pop]
      block.call(node.value) if block_given?
      node.neighbors.each { |neighbor| queue, visited = add_to_queue(neighbor, queue, visited) }
    end
    visited
  end

  private

  def add_to_queue(neighbor, queue, visited)
    unless visited.include?(neighbor)
      queue.unshift(neighbor)
      visited << neighbor
    end
    [queue, visited]
  end
end
