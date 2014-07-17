require './lib/checking_entry'

describe CheckingEntry do
  it 'can tell if checking entries are equal' do
    entry1 = CheckingEntry.new('2014-04-01', "Deposit ATM", 3000.00)
    entry2 = CheckingEntry.new('2014-04-01', "Deposit ATM", 3000.00)
    entry3 = CheckingEntry.new('2014-04-01', "Sleek Metal Shirt", 3000.00)
    entry4 = CheckingEntry.new('2014-04-03', "Sleek Metal Shirt", 3000.00)
    entry5 = CheckingEntry.new('2014-04-01', "Sleek Metal Shirt", 100.00)

    expect(entry1).to eq(entry2)
    expect(entry3).to_not eq(entry2)
    expect(entry3).to_not eq(entry4)
    expect(entry3).to_not eq(entry5)
  end
end