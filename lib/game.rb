def apply_rules(initial_board, rules)
  cells = initial_board.cells.flatten
  cells.each do |cell|
    rules.each do |rule|
      action = rule.alive?(cell)
      next if action.nil?

      action ? cell.revive : cell.kill
    end
  end
  cells.each(&:apply)
end
