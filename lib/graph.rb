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

  def bfs(start_point, end_point)
    queue, visited, predecessor, distance = initial_variables(start_point)
    until queue.empty?
      key = queue.pop
      nodes[key].neighbors.each do |neighbor|
        next if visited.include?(neighbor)

        queue, visited, predecessor, distance = adjust_queue([key, neighbor], queue, visited, predecessor, distance)
        return [distance, predecessor] if neighbor == end_point
      end
    end
    nil
  end

  private

  def adjust_queue(nodes, queue, visited, predecessor, distance)
    visited << nodes[1]
    distance[nodes[1]] = distance[nodes[0]] + 1
    predecessor[nodes[1]] = nodes[0]
    queue.unshift(nodes[1])
    [queue, visited, predecessor, distance]
  end

  def create_variables
    queue = []
    visited = []
    predecessor = {}
    distance = {}
    [queue, visited, predecessor, distance]
  end

  def initial_variables(start_point)
    queue, visited, predecessor, distance = create_variables
    distance[start_point] = 0
    [queue.unshift(start_point), visited << start_point, predecessor, distance]
  end
end
