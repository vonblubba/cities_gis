# frozen_string_literal: true

namespace :export_cities do
  # sample usage:
  # rake export_cities:highest_by_nation
  desc 'Exports highesty city by nation from Location'
  task :highest_by_nation, [:filename] => :environment do |_t, args|
    FileUtils.rm_f(output_file) if File.exist?(output_file)

    if args[:filename].present?
      LocationCsvImportService.new(args[:filename]).run
    else
      LocationCsvImportService.new.run
    end

    result = Location.highest_cities_by_nation

    File.open(output_file, 'w') do |f|
      result.each do |item|
        formatted_item = format_item(item)
        puts formatted_item
        f.write formatted_item
      end
    end
  end

  def format_item(item)
    "#{item.max}m - #{item.city}, #{item.country}\n"
  end

  def output_file
    Rails.root.join('data', 'output', 'highest_cities_by_nation.txt')
  end
end
