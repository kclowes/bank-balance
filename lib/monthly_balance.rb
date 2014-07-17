require './lib/checking_account'
require './lib/credit_card_account'

class MonthlyBalance

  def initialize(directory)
    @directory = directory

  end

  def for(month, year)
    balance = 0
    entries = CheckingAccount.new(@directory).entries_for(month, year) +
    CreditCardAccount.new(@directory).entries_for(month, year)
    entries.each do |entry|
      balance += entry.dollar_amount
    end
    balance.round(2)
  end

end