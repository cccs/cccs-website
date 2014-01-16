#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'bundler/setup'

require 'date'
require 'yaml'


def event(day, dayoffset, title, location)
  startDate = Time.local(day.year, day.month, day.day + dayoffset, 18, 0, 0)
  {
    'title' => title,
    'startdate' => startDate,
    'duration' => '4h',
    'location' => {
      'location' => location
    }
  }
end


year=ARGV[0].to_i
result = { 'events' => [] }

for month in 1..12
  date = Date.new(year,month,1)
  firsttuesday = if (date.wday<=2)
                   date + (2-date.wday)
                 else
                   date + (9-date.wday)
                 end
  firstwednesday = if (date.wday<=3)
                   date + (3-date.wday)
                 else
                   date + (10-date.wday)
                 end
  result['events'] << event(firsttuesday, 0, 'CCCS-Stammtisch (Zadu-Bar)', 'zadu')
  result['events'] << event(firstwednesday, 14, 'CCCS-Stammtisch (shackspace)', 'shack')
end

puts result.to_yaml

