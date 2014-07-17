require 'csv'
require './lib/checking_entry'


class CheckingAccount

  def initialize(directory)
    @directory = directory
  end

  def entries_for(month, year)
    expanded_path = File.expand_path("../#{@directory}", __dir__)
    files = Dir.glob(File.join(expanded_path, "statement-checking-#{month}-#{year}.csv"))
    checking_entry_array = []
    files.each do |file|
      csv_lines = CSV.read(file, headers: true)
      csv_lines.each do |line|

        amount = if line[2].nil?
                   line[3].gsub('$', '-').to_f
                 else
                   line[2].gsub('$', '').gsub(',', '').to_f
                 end
        checking_entry_array << CheckingEntry.new(line[0], line[1], amount)
      end
    end
    checking_entry_array
  end
end