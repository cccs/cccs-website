#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'bundler/setup'

require 'yaml'
require 'feedzirra'

def getBlogroll(blogroll_file)
  blogroll_raw = YAML.load_file(blogroll_file)
  blogroll = { }
  blogroll_raw['blogroll'].each { |blog| blogroll[blog['feed']]=blog['user'] }
  blogroll
end


blogroll_file = ARGV[0]
blogposts_file = ARGV[1]

# Read existing data
blogposts = if File.exists?(blogposts_file)
              YAML.load_file(blogposts_file)
            else
              { }
            end
if !blogposts['blogposts']
  blogposts['blogposts'] = []
end
blogroll = getBlogroll(blogroll_file)

# Build list for detecting duplicates
posturls = blogposts['blogposts'].map { |post| post['url'] }

# Read feed
feeds = Feedzirra::Feed.fetch_and_parse(blogroll.keys)

# Add feed data
feeds.each do |feed,data|
  data.entries.each do |posting|
    if !posturls.include?(posting.url)
      postdata = { }
      postdata['user'] = blogroll[feed]
      postdata['date'] = posting.published
      postdata['title'] = posting.title
      postdata['url'] = posting.url
      blogposts['blogposts'] << postdata
    end
  end
end

# Sort, limit list
blogposts['blogposts'].sort! { |a,b| b['date'] <=> a['date'] }
blogposts['blogposts'] = blogposts['blogposts'][0..19]

# Output
File.open(blogposts_file, 'w+') {|f| f.write(blogposts.to_yaml) }

