require 'csv'

namespace :stock_data do
  task :load_db => :environment do
    %w[nasdaq nyse amex].each do |exch|
      file = File.expand_path("../../../db/csv/#{exch}.csv", __FILE__)
      CSV.foreach(file) do |row|
        stock = Stock.new.tap do |s|
          s.name = row[1]
          s.symbol = row[0]
        end
        stock.save!
      end
    end
  end
end
