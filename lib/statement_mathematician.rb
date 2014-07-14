require 'money'

class StatementMathematician
  def initialize(input)
    @input = input
  end

  def do_math
    debit = 0
    credit = 0
    @input.each do |array|
      if array[3] != nil
        money = array[3].gsub('$', '')
        debit += Money.new(money).fractional
      else
        credit += Money.new(array[2].gsub('$', '')).fractional * 1000
      end
    end
    "$#{(credit - debit)}"
  end
end