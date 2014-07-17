class CreditCardEntry

  attr_reader :description, :date, :dollar_amount

  def initialize(date, description, dollar_amount)
    @description = description
    @date = date
    @dollar_amount = dollar_amount
  end

  def ==(other_entry)
    self.description == other_entry.description &&
      self.date == other_entry.date &&
      self.dollar_amount == other_entry.dollar_amount
  end
end