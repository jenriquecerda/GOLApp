require 'helpers/spec_helper'
require 'game_rules/third_rule'

RSpec.describe ThirdRule do
  context 'cell is alive' do
    before(:each) do
      @alive_cell = double
      allow(@alive_cell).to receive(:alive?) { true }
    end

    it 'kills cell if more than three live neighbors' do
      alive_neighbors = (1..4).collect { build_cell(:alive) }
      dead_neighbors = (1..4).collect { build_cell(:dead) }
      neighbors = alive_neighbors.concat(dead_neighbors)

      allow(@alive_cell).to receive(:neighbors) { neighbors }

      expect(ThirdRule.alive?(@alive_cell)).to eq(false)
    end

    it 'returns nil if three or less than three live neighbors' do
      alive_neighbors = (1..3).collect { build_cell(:alive) }
      dead_neighbors = (1..5).collect { build_cell(:dead) }
      neighbors = alive_neighbors.concat(dead_neighbors)

      allow(@alive_cell).to receive(:neighbors) { neighbors }

      expect(ThirdRule.alive?(@alive_cell)).to eq(nil)
    end
  end

  context 'cell is dead' do
    before(:each) do
      @dead_cell = double
      allow(@dead_cell).to receive(:alive?) { false }
    end

    it 'returns if cell is dead' do
      expect(ThirdRule.alive?(@dead_cell)).to eq(nil)
    end
  end
end
