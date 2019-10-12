# frozen_string_literal: true

module Fusion
  module Base
    def self.table_name_prefix
      'fusion_'
    end

    def self.pretty_columns(prefix, options = {})
      # add whatever column name you want here
      skipped_columns = options[:except] || []
      columns.each do |column|
        column_name = column.name
        next if skipped_columns.include? column_name

        unprefixed_col = column_name.scan(/^#{prefix}(.*)/).flatten.first

        define_method unprefixed_col.to_s do
          send column_name.to_s
        end

        define_method "#{unprefixed_col}=" do |value|
          send(column_name, value)
        end
      end
    end
  end
end
