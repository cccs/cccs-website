#!/usr/bin/env ruby
# encoding: utf-8

require 'date'
require 'ri_cal'


days=ARGV[0].to_i
infotext=ARGV[1]

if (ARGV.length>2)
  outputlen=ARGV[2].to_i
else
  outputlen=140
end

RiCal.parse($stdin).each do |calendar|
  calendar.events.each do |event|
    start = event.dtstart.to_date
    if (start-Date.today())==days
      output = "#{infotext} #{event.summary}".byteslice(0,outputlen)
      if event.url and event.url.length>0
        urllen = event.url.length
        if output.length + urllen + 1 > outputlen
          output = "#{output.byteslice(0,outputlen - urllen - 1)} #{event.url}"
        else
          output = "#{output} #{event.url}"
        end
      end
      puts output
    end
  end
end
