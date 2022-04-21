def build_cell(status)
  cell_double = double
  case status
  when :dead
    allow(cell_double).to receive(:alive?) { false }
  when :alive
    allow(cell_double).to receive(:alive?) { true }
  end
  cell_double
end
