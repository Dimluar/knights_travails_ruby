# frozen_string_literal: true

# Graph's node
class Node
  attr_reader :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def add_edge(neighbor)
    @neighbors << neighbor unless @neighbors.include?(neighbor)
  end
end
