# encoding: utf-8

module Nanoc::DataSources::Contrib

  # Fetch data from downloaded twitter csv file
  class Twitter < Nanoc::DataSource
    identifier :twitter_file

    def items
      @items ||= begin
        require 'csv'

        if @site.config[:twitter_file].nil?
          raise Nanoc::Errors::GenericTrivial.new('Cannot read Twitter data: site configuration has no twitter_file')
        end

        # Get data
        if ! File.exists?(@site.config[:twitter_file])
          return []
        end

        # Convert to items
        @items = []
        CSV.foreach(@site.config[:twitter_file]) do |row|
          # Get data
          content = row[3]
          attributes = {
            :kind        => 'twitter',
            :id          => row[0],
            :date        => Time.parse(row[1]),
            :nick        => row[2],
            :url         => "https://twitter.com/#{row[2]}/status/#{row[0]}"
          }
          identifier = "/_twitter/#{row[0]}/"
          mtime = Time.parse(row[1])

          # Build item
          @items += [ Nanoc::Item.new(content, attributes, identifier, mtime) ]
        end
        @items
      end
    end

  end

end
