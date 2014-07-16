require 'rspec'
require './lib/balance'

describe Balance do
  it 'will return a dollar amount' do
    bal = Balance.new
    input = [[['2014-04-27', 'Check #1092', nil, '$82.00'],
              ['2014-04-30', 'Deposit ATM', "$3,000.00", nil]]]
    cc_input = [[['2014-04-01', 'Gorgeous Cotton Chair', '$8.82'],
                 ['2014-04-03', 'Fantastic Concrete Shirt', '$45.81']]]
    actual = bal.monthly_math(input, cc_input)
    expect(actual).to eq(['$2863.37'])
  end

  it 'will return the right format' do
    bal = Balance.new
    input = [[['2014-04-27', 'Check #1092', nil, '$82.00'],
              ['2014-04-30', 'Deposit ATM', "$3,000.00", nil]]]
    cc_input = [[['2014-04-01', 'Gorgeous Cotton Chair', '$8.82'],
                 ['2014-04-03', 'Fantastic Concrete Shirt', '$45.81']]]
    actual = bal.formatter(input, cc_input)
    expect(actual).to eq([{'April' => '$2863.37'}])
  end

  it 'will return multiple month names' do
    pending
    bal = Balance.new
    input = [[['2014-04-27', 'Check #1092', nil, '$82.00'],
              ['2014-04-30', 'Deposit ATM', "$3,000.00", nil]],
             [['2014-05-25', 'Check #1108', nil, '$82.00'],
              ['2014-05-31', 'Deposit Bank', "$3,100.00", nil]],
             [['2014-02-25', 'Check #1108', nil, '$82.00'],
              ['2014-02-03', 'Deposit Bank', "$3,200.00", nil]],
    ]
    cc_input = [[['2014-04-01', 'Gorgeous Cotton Chair', '$8.82'],
                 ['2014-04-03', 'Fantastic Concrete Shirt', '$45.81']]]
    actual = bal.formatter(input, cc_input)
    expect(actual).to eq(['February' => '$3118', 'April' => '$2863.37', 'May' => '$3018'])
  end
end