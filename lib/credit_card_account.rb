require 'csv'
require './lib/credit_card_entry'

class CreditCardAccount

  def initialize(directory)
    @directory = directory
  end

  def entries_for(month, year)
    expanded_path = File.expand_path("../#{@directory}", __dir__)
    files = Dir.glob(File.join(expanded_path, "statement-credit-card-#{month}-#{year}.csv"))
    credit_entry_array = []
    files.each do |file|
      csv_lines = CSV.read(file, headers: true)
      csv_lines.each do |line|
        price = line[2].gsub('$', '-').to_f
        credit_entry_array << CreditCardEntry.new(line[0], line[1], price)
      end

    end
    credit_entry_array
  end

end