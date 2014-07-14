require 'rspec'
require './lib/statement_mathematician'

describe StatementMathematician do
  it 'will return a difference of numbers from checking in the correct format' do
    input = [[['2014-01-05', 'Check #1025', nil, '$60.00'],
              ['2014-01-05', 'Check #1026', nil, '$120.00'],
              ['2014-04-30', 'Deposit ATM', '$3,000.00', nil]]]
    actual = StatementMathematician.new.checking_math(input)
    expect(actual).to eq('$2820')
  end

  it 'will return a difference of numbers from the credit card statement' do
    input = [[['2014-04-01', 'Sleek Cotton Shirt', '$94.79'],
              ['2014-04-01', 'Gorgeous Cotton Chair', '$8.82'],
              ['2014-04-03', 'Fantastic Concrete Shirt', '$45.81']]]
    actual = StatementMathematician.new.credit_card_math(input)
    expect(actual).to eq('$149.42')
  end

  it 'will subtract the credit card from the checking balance' do
    checking_input = [[['2014-04-05', 'Check #1025', nil, '$60.00'],
                       ['2014-04-05', 'Check #1026', nil, '$120.00'],
                       ['2014-04-30', 'Deposit ATM', '$3,000.00', nil]]]
    cc_input=[[['2014-04-01', 'Sleek Cotton Shirt', '$94.79'],
               ['2014-04-01', 'Gorgeous Cotton Chair', '$8.82'],
               ['2014-04-03', 'Fantastic Concrete Shirt', '$45.81']]]
    actual = StatementMathematician.new.monthly_balance(checking_input, cc_input)
    expect(actual).to eq('$2670.58')
  end

  it 'will return an array of months and balances' do
    checking_input = [[['2014-04-05', 'Check #1025', nil, '$60.00'],
                       ['2014-04-05', 'Check #1026', nil, '$120.00'],
                       ['2014-04-30', 'Deposit ATM', '$3,000.00', nil]]]
    cc_input=[[['2014-04-01', 'Sleek Cotton Shirt', '$94.79'],
               ['2014-04-01', 'Gorgeous Cotton Chair', '$8.82'],
               ['2014-04-03', 'Fantastic Concrete Shirt', '$45.81']]]
    actual = StatementMathematician.new.formatter(checking_input, cc_input)
    expect(actual).to eq([{'April' => '$2670.58'}])
  end
end