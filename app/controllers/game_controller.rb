require 'cell'
require 'game'
require 'game_rules/first_rule'
require 'game_rules/second_rule'
require 'game_rules/third_rule'
require 'game_rules/fourth_rule'

class GameController < ApplicationController
  def show
    @board = Board.instance

    if @board.is_empty?
      initialize_game
    else
      apply_rules(@board, [FirstRule, SecondRule, ThirdRule, FourthRule])
    end

    @data = @board.cells.flatten.collect { |cell| cell.alive? ? 1 : 0 }
  end

  private

  def initialize_game
    @board.size = [50, 50]

    fill_with_empty_cells_with_random_state
  end

  def fill_with_empty_cells_with_random_state
    height = @board.size[1] - 1
    width = @board.size[0] - 1
    (0..height).each do |row|
      (0..width).each do |col|
        @board.add(Cell.new([row, col], [true, false].sample))
      end
    end
  end

  def fill_with_initial_live_cells
    @board.add(Cell.new([3, 3], true))
    @board.add(Cell.new([1, 1], true))
    @board.add(Cell.new([1, 2], true))
    @board.add(Cell.new([2, 1], true))
    @board.add(Cell.new([2, 2], true))

    @board.add(Cell.new([5, 5], true))
    @board.add(Cell.new([4, 6], true))
    @board.add(Cell.new([5, 6], true))
    @board.add(Cell.new([6, 6], true))
  end
end
