class CheckingEntry

  attr_reader :date, :description, :dollar_amount

  def initialize(date, description, dollar_amount)
    @date = date
    @description = description
    @dollar_amount = dollar_amount
  end

  def ==(other_entry)
    @date == other_entry.date &&
      @description == other_entry.description &&
      @dollar_amount == other_entry.dollar_amount
  end

end