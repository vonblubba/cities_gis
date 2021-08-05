# frozen_string_literal: true

require 'csv'

# Service to import csv location data
class LocationCsvImportService
  attr_reader :filename

  def initialize(file = 'World_Cities_Location_table.csv')
    @filename = Rails.root.join('data', 'input', file)
  end

  def run
    return false unless File.file?(filename)

    Location.delete_all

    columns = %i[country city latitude longitude altitude]
    locations = []

    CSV.foreach(filename, headers: false, col_sep: ';') do |row|
      next if row[2].nil? # skip if city field is empty

      locations << row.drop(1)
    end

    Location.import(columns, locations)
  end
end
