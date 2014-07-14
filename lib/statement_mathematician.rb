require 'money'
require 'date'

class StatementMathematician

  def checking_math(input)
    debit = 0
    credit = 0
    input.each do |month|
      month.each do |array|
        if array[3] != nil
          money = array[3].gsub('$', '')
          debit += Money.new(money).fractional
        else
          credit += Money.new(array[2].gsub('$', '')).fractional * 1000
        end
      end
    end
    "$#{(credit - debit)}"
  end


  def credit_card_math(input)
    balance = 0
    input.each do |month|
      month.each do |array|
        money = array[2].gsub('$', '').to_f
        balance += Money.new(money * 100).fractional.to_f / 100
      end
    end
    "$#{balance.round(2)}"
  end


  def monthly_balance(checking_input, cc_input)
    end_of_month = checking_math(checking_input).gsub('$', '').to_f.round(2) - credit_card_math(cc_input).gsub('$', '').to_f.round(2)
    "$#{end_of_month}"
  end

  def formatter(checking_input, cc_input)
    a = []
    hash = {}
    checking_input.each do |month|
      month.map do |array|
        a << Date::MONTHNAMES[Date.parse(array[0]).month]
      end
    end
    a.uniq.each do |mon|
      hash[mon] = monthly_balance(checking_input, cc_input)
    end
    [hash]
  end


end