require 'csv'

class StatementOpener

  def read_checking_statements
    files = File.expand_path('../data/*checking*', __dir__)
    checking_array = []
    Dir.glob(files) do |file|
      checking_array = CSV.readlines(file)
    end
    checking_array
  end

  def read_cc_statements
    files = File.expand_path('../data/*credit-card*', __dir__)
    cc_array = []
    Dir.glob(files) do |file|
      cc_array = CSV.readlines(file)
    end
    cc_array
  end
end

p StatementOpener.new.read_checking_statements

