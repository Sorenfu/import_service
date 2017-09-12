require 'roo'

namespace :xlsx do
  desc 'Get xlsx data'
  task get_data: :environment do
    xlsx_files = Dir["#{Rails.root.to_s}/db/xlsx_data/*"].map{ |f| File.basename(f) }
    xlsx_files.each do |file_name|
      xlsx = Roo::Spreadsheet.open(File.expand_path("#{Rails.root.to_s}/db/xlsx_data/#{file_name}"))
      xlsx_sheet = xlsx.sheet('LCL Import Rates')
      for i in 7..xlsx_sheet.last_row
        row = xlsx_sheet.row(i)
        unless i == 7
          sheet = Sheet.new(pol: row[3], pod: row[5], rate_wm: row[7], rate_min: row[8], tt: row[10])
          p "#{sheet.pol} | #{sheet.pod} | #{sheet.rate_wm} | #{sheet.rate_min} | #{sheet.tt}" if sheet.save
        end
      end
    end
  end
end