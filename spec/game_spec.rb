require 'game'

RSpec.describe '#apply_rules' do
  it 'kills Cell if rule tells to do so' do
    mock_cell = double
    allow(mock_cell).to receive(:apply)

    mock_board = double
    allow(mock_board).to receive(:cells) { [mock_cell] }

    double_rule = double
    allow(double_rule).to receive(:alive?).with(mock_cell) { false }

    expect(mock_cell).to receive(:kill)
    expect(mock_cell).not_to receive(:revive)

    apply_rules(mock_board, [double_rule])
  end

  it 'revives Cell if rules tells to do so' do
    mock_cell = double
    allow(mock_cell).to receive(:apply)

    mock_board = double
    allow(mock_board).to receive(:cells) { [mock_cell] }

    double_rule = double
    allow(double_rule).to receive(:alive?).with(mock_cell) { true }

    expect(mock_cell).to receive(:revive)
    expect(mock_cell).not_to receive(:kill)

    apply_rules(mock_board, [double_rule])
  end

  it 'does nothing if rules tells to do nothing' do
    mock_cell = double
    allow(mock_cell).to receive(:apply)

    mock_board = double
    allow(mock_board).to receive(:cells) { [mock_cell] }

    double_rule = double
    allow(double_rule).to receive(:alive?).with(mock_cell) { nil }

    expect(mock_cell).not_to receive(:revive)
    expect(mock_cell).not_to receive(:kill)

    apply_rules(mock_board, [double_rule])
  end
end
