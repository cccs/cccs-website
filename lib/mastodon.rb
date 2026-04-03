# encoding: utf-8
require 'json'
require 'time'

module Nanoc::DataSources::Contrib

  # Fetch data from downloaded mastodon json file
  class Mastodon < Nanoc::DataSource
    identifier :mastodon_file

    def items
      @items ||= begin
        if @site.config[:mastodon_file].nil?
          raise Nanoc::Errors::GenericTrivial.new('Cannot read Mastodon data: site configuration has no mastodon_file')
        end

        # Get data
        unless File.exist?(@site.config[:mastodon_file])
          return []
        end

        # Convert to items
        @items = []
        data = JSON.parse(File.read(@site.config[:mastodon_file]))
       
          data.each do |post|
          id = post['id']
          date = Time.parse(post['created_at'])
          nick = post.dig('account', 'acct')
          
          # 1. URL manuell im gewünschten Format erzwingen
          url = "https://chaos.social/@cccs/#{id}"

          # 2. Text auslesen (berücksichtigt leere Felder bei Boosts/Reblogs)
          content = post['content']
          if content.nil? || content.empty?
            content = post.dig('reblog', 'content') || ""
          end

          attributes = {
            :kind        => 'mastodon',
            :id          => id,
            :date        => date,
            :nick        => nick,
            :url         => url
          }
          identifier = "/_mastodon/#{id}/"

          # Build item
          @items += [ Nanoc::Item.new(content.to_s, attributes, identifier, date) ]
        end 

        @items
      end
    end

  end

end
