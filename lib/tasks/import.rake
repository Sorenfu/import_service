require 'roo'

namespace :xlsx do
  desc 'Get xlsx data'
  task get_data: :environment do
    xlsx_files = Dir["#{Rails.root.to_s}/db/xlsx_data/*"].map{ |f| File.basename(f) }
    xlsx_files.each do |file_name|
      xlsx = Roo::Spreadsheet.open(File.expand_path("#{Rails.root.to_s}/db/xlsx_data/#{file_name}"))
      sheet = xlsx.sheet('LCL Import Rates')
      for i in 7..sheet.last_row
        row = sheet.row(i)
        p "#{row[3]} | #{row[5]} | #{row[3]} | #{row[7]} | #{row[8]} | #{row[10]}"
      end
    end
  end
end