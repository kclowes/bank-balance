require './lib/monthly_balance'

describe MonthlyBalance do
  it 'can calculate a balance of a given month and year' do

    balance = MonthlyBalance.new('spec/fixtures')
    actual = balance.for('april', 2014)
    expected = (3000-60.99-94.79-8.82)
    expect(actual).to eq(expected)
  end
end