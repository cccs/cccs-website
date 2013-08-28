#!/usr/bin/env ruby
# encoding: utf-8

require 'date'
require 'yaml'


def event(day, dayoffset, location)
  startDate = Time.new(day.year, day.month, day.day + dayoffset, 18, 0, 0, "+02:00")
  {
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
  result['events'] << event(firsttuesday, 0, 'zadu')
  result['events'] << event(firsttuesday, 15, 'shack')
end

puts result.to_yaml

