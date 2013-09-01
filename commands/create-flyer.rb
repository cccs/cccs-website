usage       'create-flyer eventnode outputdir'
aliases     :cf
summary     'creates svg for flyer'
description 'Create SVG file with content of given event'

class CreateFlyer < ::Nanoc::CLI::CommandRunner
  def run
    # Check arguments
    if arguments.length!=2
      puts command.help
      exit 1
    end
    # Get node, check type
    self.load_site
    nodename = sanitize_path(arguments[0])
    event = self.site.items[nodename]
    if !event
      puts "Node #{nodename} not found"
      exit 1
    end
    if !event[:kind]=='event'
      puts "Node #{nodename} is not an event"
      exit 1
    end
    # Collect data
    merge_item_location_data(event[:location], self.site.items['/_data/locations/'].attributes)
    self.site.compile
    title = event[:title]
    date = event[:startdate]
    speakers = event[:speakers].map { |s| if s[:affiliation] then "#{s[:name]} (#{s[:affiliation]})" else s[:name] end }
    text = Nokogiri::HTML(event.compiled_content)
    text = text.content.gsub(/\n+/,"\n")
    location_infos = [event[:location][:name]]
    if (event[:location][:details])
      location_infos << event[:location][:details]
    end
    if (event[:location][:strasse])
      location_infos << event[:location][:strasse]
    end
    if (event[:location][:ort])
      if (event[:location][:plz])
        location_infos << "#{event[:location][:plz]} #{event[:location][:ort]}"
      else
        location_infos << event[:location][:ort]
      end
    end
    if (event[:location][:lon])
      location_infos << "N #{event[:location][:lon]} E #{event[:location][:lat]}"
    end
    calendar_items = self.site.items.select do |i|
      (i[:kind]=='event') && (i[:startdate].to_datetime>event[:startdate].to_datetime) && !i.identifier.start_with?('/_data/stammtisch/')
    end.sort { |a,b| a[:startdate].to_datetime <=> b[:startdate].to_datetime }
    calendar = calendar_items[0..5].map do |i|
      if i[:startdate].instance_of?(Date)
        "#{i[:startdate].strftime("%d.%m.%Y")} #{i[:title]}"
      else
        "#{i[:startdate].strftime("%d.%m.%Y, %H:%M")} #{i[:title]}"
      end
    end
    # Read template
    file = File.open(self.site.items['/_data/aushang/'].raw_filename(), "r:UTF-8")
    template = file.read
    file.close()
    # Replace in template
    template.gsub!('${title}', title)
    template.gsub!('${date}', date.strftime("%d.%m.%Y, %H:%M"))
    template.gsub!('${speakers}', speakers.join(', '))
    template.gsub!('${location}', location_infos.join(", "))
    template.gsub!('${calendar}', calendar.join(" \n"))
    # Output
    File.open("#{arguments[1]}/aushang.svg", 'w:UTF-8') {|f| f.write(template) }
  end
end

runner CreateFlyer

