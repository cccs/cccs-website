#!/usr/bin/env ruby
# encoding: utf-8

# Convert to UTF8: iconv -f ISO-8859-15 -t UTF-8 infile > outfile

file = File.open(ARGV[0])
header = {}
body = ''
in_header = true
last_header = nil
file.each do |line|
  if in_header
    if line =~ /^\s*$/
      # do nothing
    elsif line =~ /^(\w*):\s*(.*)$/
      # New header
      last_header = $1.downcase
      header[last_header] = $2.strip
    elsif line =~ /^\s+(.*)$/
      # Continued header
      header[last_header] << " #{$1.strip}"
    else
      # First line of body
      body << line
      in_header = false
    end
  else
    body << line
  end
end

puts "---"
puts "kind: event"
date = header['datum']
if date =~ /^.*,\s*(.*)$/
  date=$1
end
if date =~ /^(\d+)\.(\d+)\.(\d+)$/
  year = $3.to_i
  month = $2.to_i
  day = $1.to_i
elsif date =~ /^(\d+).\s*([^\s]+)\s+(\d+)$/
  year = $3.to_i
  month = case $2.downcase[0..2]
            when 'jan'
              1
            when 'feb'
              2
            when 'mär'
              3
            when 'apr'
              4
            when 'mai'
              5
            when 'jun'
              6
            when 'jul'
              7
            when 'aug'
              8
            when 'sep'
              9
            when 'okt'
              10
            when 'nov'
              11
            when 'dez'
              12
            else
              0
            end
  day = $1.to_i
else
  year = 0
  month = 0
  day = 0
end
if (year<100)
  if (year<80)
    year = year + 2000
  else
    year = year + 1900
  end
end
puts "startdate: %04d-%02d-%02dT19:30:00" % [year,month,day]
puts "duration: 2h"
puts "title: #{header['thema']}"
puts "speakers:"
puts "  -"
puts "    name: #{header['referent']}"
if (header['ort'].downcase.start_with?('stadtbibliothek'))
  puts "location:"
  puts "  location: bib"
elsif (header['ort'].downcase.start_with?('filmhaus'))
  puts "location:"
  puts "  location: wand5"
end
puts "public: true"
puts "---"
puts body

