require './lib/checking_account'
require './lib/credit_card_account'

class MonthlyBalance

  def initialize(directory)
    @directory = directory
  end

  def for(month, year)
    entries = CheckingAccount.new(@directory).entries_for(month, year) +
      CreditCardAccount.new(@directory).entries_for(month, year)
    entries.inject(0) { |acc, entry| acc + entry.dollar_amount }.round(2)
  end

end