module FourthRule
  def self.alive?(cell)
    return if cell.alive?

    neighbors = cell.neighbors

    alive_neighbors = neighbors.filter { |neighbor| neighbor if neighbor.alive? }

    return true if alive_neighbors.length == 3
  end
end
