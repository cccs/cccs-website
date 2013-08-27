#!/usr/bin/env ruby
# encoding: utf-8

require 'date'
require 'yaml'

year=ARGV[0].to_i
result = { 'events' => [] }

for month in 1..12
  date = DateTime.new(year,month,1,18,0,0)
  firsttuesday = if (date.wday<=2)
                   date + (2-date.wday)
                 else
                   date + (9-date.wday)
                 end
  result['events'] << {
    'startdate' => firsttuesday.to_time,
    'duration' => '4h',
    'location' => {
      'location' => 'zadu'
    }
  }
  result['events'] << {
    'startdate' => (firsttuesday+15).to_time,
    'duration' => '4h',
    'location' => {
      'location' => 'shack'
    }
  }
end

puts result.to_yaml

