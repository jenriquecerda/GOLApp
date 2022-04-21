require 'helpers/spec_helper'
require 'game_rules/first_rule'

RSpec.describe FirstRule do
  context 'cell is alive' do
    before(:each) do
      @alive_cell = double
      allow(@alive_cell).to receive(:alive?) { true }
    end

    it 'kills cell if 0 live neighbors' do
      dead_neighbors = (1..8).collect { build_cell(:dead) }

      allow(@alive_cell).to receive(:neighbors) { dead_neighbors }

      expect(FirstRule.alive?(@alive_cell)).to eq(false)
    end

    it 'kills cell if 1 live neighbors' do
      alive_neighbors = [ build_cell(:dead) ]
      dead_neighbors = (1..8).collect { build_cell(:dead) }
      neighbors = alive_neighbors.concat(dead_neighbors)

      allow(@alive_cell).to receive(:neighbors) { neighbors }

      expect(FirstRule.alive?(@alive_cell)).to eq(false)
    end
  end

  context 'cell is dead' do
    before(:each) do
      @alive_cell = double
      allow(@alive_cell).to receive(:alive?) { false }
    end

    it 'returns if cell is dead' do
      expect(FirstRule.alive?(@alive_cell)).to eq(nil)
    end
  end
end
