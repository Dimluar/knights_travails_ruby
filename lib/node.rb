# frozen_string_literal: true

# Graph's node
class Node
  attr_reader :value

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def add_edge(neighbor)
    @neighbors << neighbor
  end
end
