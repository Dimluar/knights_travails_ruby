# frozen_string_literal: true

require_relative 'graph'

# Knight piece
class Knight
  attr_reader :move_set

  def initialize
    @move_set = knight_graph
  end

  def shortest_path(start_point, end_point, path = [end_point])
    return puts "\nPoints are not conected.\n\n" if move_set.bfs(start_point, end_point).nil?
    return puts "\nInvalid move.\n\n" unless legal?(start_point) && legal?(end_point)

    distance, predecessor = move_set.bfs(start_point, end_point)
    tmp_start_point = end_point
    until tmp_start_point == start_point
      path.unshift(predecessor[tmp_start_point])
      tmp_start_point = predecessor[tmp_start_point]
    end
    display_result(end_point, distance, path)
  end

  private

  def display_result(end_point, distance, path)
    puts "\nYou made it in #{distance[end_point]} moves!  Here's your path:"
    path.each { |move| p move }
    puts ''
  end

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
      move = [new_x, new_y]
      new_moves << move if legal?(move)
    end
    new_moves
  end

  def legal?(position)
    position[0].between?(0, 7) && position[1].between?(0, 7) ? true : false
  end
end
