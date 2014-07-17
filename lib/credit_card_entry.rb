class CreditCardEntry

  attr_reader :description, :date, :price

  def initialize(date, description, price)
    @description = description
    @date = date
    @price = price
  end

  def ==(other_entry)
    self.description == other_entry.description &&
      self.date == other_entry.date &&
      self.price == other_entry.price
  end
end