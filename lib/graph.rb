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
    nodes[value1].add_edge(nodes[value2])
    nodes[value2].add_edge(nodes[value1])
  end
end
