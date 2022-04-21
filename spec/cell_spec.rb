require 'cell'

RSpec.describe Cell do
  it 'has alive state' do
    cell = Cell.new

    expect(cell.alive?).to eq(false)
  end

  it 'allows alive state to be modified after apply to dirty state' do
    cell = Cell.new

    cell.revive
    expect(cell.alive?).to eq(false)

    cell.apply
    expect(cell.alive?).to eq(true)

    cell.kill
    expect(cell.alive?).to eq(true)

    cell.apply
    expect(cell.alive?).to eq(false)
  end

  it 'returns neighbors' do
    board = Board.instance
    board.size = [4, 4]

    top_cell = Cell.new([0, 1])
    left_cell = Cell.new([1, 0])
    right_cell = Cell.new([1, 2])
    bottom_cell = Cell.new([2, 1])

    board.add(top_cell)
    board.add(left_cell)
    board.add(right_cell)
    board.add(bottom_cell)

    cell = Cell.new([1, 1])
    board.add(cell)

    neighbors = cell.neighbors

    expect(neighbors).to include(top_cell)
    expect(neighbors).to include(left_cell)
    expect(neighbors).to include(right_cell)
    expect(neighbors).to include(bottom_cell)

    empty_neighbors = neighbors.select(&:nil?)
    expect(empty_neighbors.length).to eq(4)
  end
end
