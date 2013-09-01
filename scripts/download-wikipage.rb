#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'bundler/setup'

require 'nokogiri'
require 'open-uri'


def empty_p?(node)
  node.name=='p' && node.content.length==0
  node.content.length==0
end


if ARGV.length==0
  abort('Need one parameter (page name)')
end

doc = Nokogiri::HTML(open("https://www.cccs.de/wiki/bin/view/Main/#{ARGV[0]}"))
content = doc.css('.twikiTopic').children

File.open("#{ARGV[0]}.html", 'w') do |file|
  file.write("---\n")
  file.write("title: #{ARGV[0]}\n")
  file.write("kind: page\n")
  file.write("---\n")
  file.write(content)
end
