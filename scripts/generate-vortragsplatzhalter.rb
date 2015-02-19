#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'bundler/setup'

require 'date'
require 'yaml'


def event(day, dayoffset, title)
  startDate = Time.local(day.year, day.month, day.day + dayoffset, 19, 30, 0)
  {
    'title' => title,
    'startdate' => startDate,
    'duration' => '2h',
    'location' => {
      'location' => 'bib'
    }
  }
end


year=ARGV[0].to_i
result = { 'events' => [] }

for month in 1..12
  date = Date.new(year,month,1)
  firstthursday = if (date.wday<=4)
                   date + (4-date.wday)
                 else
                   date + (11-date.wday)
                 end
  result['events'] << event(firstthursday, 7, 'CCCS Vortragsreihe (Thema noch offen)')
end

puts result.to_yaml

