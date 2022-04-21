require 'helpers/spec_helper'
require 'game_rules/fourth_rule'

RSpec.describe FourthRule do
  context 'cell is dead' do
    before(:each) do
      @dead_cell = double
      allow(@dead_cell).to receive(:alive?) { false }
    end

    it 'revives if exactly three live neighbors' do
      alive_neighbors = (1..3).collect { build_cell(:alive) }
      dead_neighbors = (1..5).collect { build_cell(:dead) }
      neighbors = alive_neighbors.concat(dead_neighbors)

      allow(@dead_cell).to receive(:neighbors) { neighbors }

      expect(FourthRule.alive?(@dead_cell)).to eq(true)
    end

    it 'returns nil if alive neighbors different than 3' do
      alive_neighbors = (1..2).collect { build_cell(:alive) }
      dead_neighbors = (1..6).collect { build_cell(:dead) }
      neighbors = alive_neighbors.concat(dead_neighbors)

      allow(@dead_cell).to receive(:neighbors) { neighbors }

      expect(FourthRule.alive?(@dead_cell)).to eq(nil)
    end
  end

  context 'cell is alive' do
    before(:each) do
      @alive_cell = double
      allow(@alive_cell).to receive(:alive?) { true }
    end

    it 'returns if cell is alive' do
      expect(FourthRule.alive?(@alive_cell)).to eq(nil)
    end
  end
end
