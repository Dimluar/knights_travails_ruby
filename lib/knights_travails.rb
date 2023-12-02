# frozen_string_literal: true

require_relative 'knight'

def knight_moves(pos1, pos2)
  Knight.new.shortest_path(pos1, pos2)
end

knight_moves([0, 0], [7, 7])
