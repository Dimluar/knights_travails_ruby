# frozen_string_literal: true

require_relative 'graph'

# Knight piece
class Knight
  attr_reader :move_set

  def initialize
    @move_set = knight_graph
  end

  private

  def knight_graph
    graph = Graph.new
    8.times do |x|
      8.times do |y|
        key = [x, y]
        graph.add_node(key)
        graph = add_edges(graph, key)
      end
    end
    graph
  end

  def add_edges(graph, key)
    new_positions = gen_legal_moves(key)
    new_positions.each do |move|
      graph.add_node(move) if graph.nodes[move].nil?
      graph.add_edge(key, move)
    end
    graph
  end

  def gen_legal_moves(key, new_moves = [])
    move_offsets = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    move_offsets.each do |dq|
      new_x = key[0] + dq[0]
      new_y = key[1] + dq[1]
      new_moves << [new_x, new_y] if new_x.between?(0, 7) && new_y.between?(0, 7)
    end
    new_moves
  end
end
