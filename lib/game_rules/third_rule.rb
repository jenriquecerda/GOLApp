module ThirdRule
  def self.alive?(cell)
    return unless cell.alive?

    neighbors = cell.neighbors

    alive_neighbors = neighbors.filter { |neighbor| neighbor if neighbor.alive? }

    return false if alive_neighbors.length > 3
  end
end
