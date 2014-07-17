require './lib/credit_card_entry'

describe CreditCardEntry do
  it 'can tell if credit card entries are equal' do
    entry1 = CreditCardEntry.new('2014-04-01', "Sleek Cotton Shirt", 94.79)
    entry2 = CreditCardEntry.new('2014-04-01', "Sleek Cotton Shirt", 94.79)
    entry3 = CreditCardEntry.new('2014-04-01', "Sleek Metal Shirt", 94.79)
    entry4 = CreditCardEntry.new('2014-04-03', "Sleek Metal Shirt", 94.79)
    entry5 = CreditCardEntry.new('2014-04-01', "Sleek Metal Shirt", 100.00)

    expect(entry1).to eq(entry2)
    expect(entry3).to_not eq(entry2)
    expect(entry3).to_not eq(entry4)
    expect(entry3).to_not eq(entry5)
  end
end