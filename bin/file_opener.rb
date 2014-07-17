require 'csv'

class FileOpener

  def open_checking_files
    file_array = []
    files = File.expand_path('../data/*checking*', __dir__)
    Dir.glob(files).each do |file|
      file_array << CSV.readlines(file)
    end
    file_array
  end

  def open_cc_files
    file_array = []
    files = File.expand_path('../data/*credit-card*', __dir__)
    Dir.glob(files).each do |file|
      file_array << CSV.readlines(file)
    end
    file_array
  end

end

p FileOpener.new.open_checking_files
p FileOpener.new.open_cc_files