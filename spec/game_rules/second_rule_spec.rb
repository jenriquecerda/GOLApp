require 'helpers/spec_helper'
require 'game_rules/second_rule'

RSpec.describe SecondRule do
  context 'cell is alive' do
    before(:each) do
      @alive_cell = double
      allow(@alive_cell).to receive(:alive?) { true }
    end

    it 'is maintained alive if 2 live neighbors' do
      alive_neighbors = (1..2).collect { build_cell(:alive) }
      dead_neighbors = (1..6).collect { build_cell(:dead) }
      neighbors = alive_neighbors.concat(dead_neighbors)

      allow(@alive_cell).to receive(:neighbors) { neighbors }

      expect(SecondRule.alive?(@alive_cell)).to eq(true)
    end

    it 'is maintained alive if 3 live neighbors' do
      alive_neighbors = (1..3).collect { build_cell(:alive) }
      dead_neighbors = (1..5).collect { build_cell(:dead) }
      neighbors = alive_neighbors.concat(dead_neighbors)

      allow(@alive_cell).to receive(:neighbors) { neighbors }

      expect(SecondRule.alive?(@alive_cell)).to eq(true)
    end

    it 'returns nil if it does not have 2 or 3 live neighbros' do
      alive_neighbors = (1..4).collect { build_cell(:alive) }
      dead_neighbors = (1..4).collect { build_cell(:dead) }
      neighbors = alive_neighbors.concat(dead_neighbors)

      allow(@alive_cell).to receive(:neighbors) { neighbors }

      expect(SecondRule.alive?(@alive_cell)).to eq(nil)
    end
  end

  context 'cell is dead' do
    before(:each) do
      @dead_cell = double
      allow(@dead_cell).to receive(:alive?) { false }
    end

    it 'returns if cell is dead' do
      expect(SecondRule.alive?(@dead_cell)).to eq(nil)
    end
  end
end
