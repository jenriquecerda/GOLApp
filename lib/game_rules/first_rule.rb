module FirstRule
  def self.alive?(cell)
    return unless cell.alive?

    neighbors = cell.neighbors

    alive_neighbors = neighbors.filter { |neighbor| neighbor if neighbor.alive? }

    alive_neighbors.length >= 2
  end
end
