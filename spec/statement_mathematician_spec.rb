require 'rspec'
require './lib/statement_mathematician'

describe StatementMathematician do
  it 'will return a difference of numbers in the correct format' do
    input = [['2014-01-05','Check #1025',nil,'$60.00'],
    ['2014-01-05','Check #1026',nil,'$120.00'],
    ['2014-04-30','Deposit ATM','$3,000.00',nil]]
    actual = StatementMathematician.new(input).do_math
    expect(actual).to eq('$2820')
  end
end