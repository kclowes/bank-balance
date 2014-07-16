class Balance
  def monthly_math(checking_input, cc_input)
    bal_array = []
    checking_input.each do |month|
      credit = 0
      debit = 0
      month.each do |line|
        if line[3].nil?
          credit += line[2].gsub('$', '').gsub(',', '').to_f.round(2)
        else
          debit += line[3].gsub('$', '').to_f.round(2)
        end
      end
      cc_input.each do |mon|
        mon.each do |liney|
          debit += liney[2].gsub('$', '').to_f
        end
      end
      balance = credit - debit
      bal_array << "$#{balance}"
    end
    bal_array
  end

  def month_namer(checking_input)
    month_array = []
    checking_input.each do |array|
      array.each do |line|
        date = Date.parse(line[0])
        month_array << Date::MONTHNAMES[date.month]
      end
    end
    month_array.uniq
  end

  def formatter(checking_input, cc_input)
    hash = {}
    i = 0
    month_namer(checking_input).each do |month|
      hash[month] = monthly_math(checking_input, cc_input)[i]
      i+=1
    end
    [hash]
  end


end