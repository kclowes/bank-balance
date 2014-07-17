require './lib/checking_account'
require './lib/checking_entry'

describe CheckingAccount do
  it 'can get a list of CheckingEntries for a month' do
    account = CheckingAccount.new('spec/fixtures')

    expected = [
      CheckingEntry.new('2014-04-30', "Deposit ATM", 3000.00),
      CheckingEntry.new('2014-04-06', "Check #1077", -60.99),
    ]

    expect(account.entries_for('april', 2014)).to match_array(expected)
  end
end