require './lib/credit_card_account'
require './lib/credit_card_entry'

describe CreditCardAccount do
  it 'can get a list of credit card entries for a month' do
    account = CreditCardAccount.new('spec/fixtures')

    expected = [
      CreditCardEntry.new('2014-04-01', "Sleek Cotton Shirt", 94.79),
      CreditCardEntry.new('2014-04-01', "Gorgeous Cotton Chair", 8.82),
    ]

    expect(account.entries_for('april', 2014)).to match_array(expected)
  end
end