class Board
  attr_accessor :size, :grid

  def self.instance
    @instance ||= new
  end

  def add(cell)
    @grid ||= Array.new(@size[0]) { Array.new(@size[1]) }

    @grid[cell.x][cell.y] = cell
    @empty = false
  end

  def cells
    @grid
  end

  def is_empty?
    @empty.nil? ? true : false
  end

  private_class_method :new
end

class Cell
  attr_writer :alive

  def initialize(location = [0, 0], is_alive = false)
    @alive = is_alive
    @location = location
  end

  def alive?
    @alive
  end

  def revive
    @dirty_state = true
  end

  def kill
    @dirty_state = false
  end

  def apply
    @alive = @dirty_state
  end

  def x
    @location[0]
  end

  def y
    @location[1]
  end

  def neighbors
    board = Board.instance

    get_neighbors(board.grid, [x, y])
  end

  private

  def get_neighbors(array, (i, j))
    [
      [i, j - 1],
      [i, j + 1],
      [i - 1, j - 1],
      [i - 1, j],
      [i - 1, j + 1],
      [i + 1, j - 1],
      [i + 1, j],
      [i + 1, j + 1]
    ].select do |h, w|
      h.between?(0, array.length - 1) && w.between?(0, array.first.length - 1)
    end.map do |row, col|
      array[row][col]
    end
  end
end
