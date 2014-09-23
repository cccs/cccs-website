usage       'create-flyer eventnode [outputdir]'
aliases     :cf
summary     'creates svg for flyer'
description 'Create SVG file with content of given event'


class CreateFlyer < ::Nanoc::CLI::CommandRunner
  require 'rqrcode_png'
  require 'pathname'

  def get_qr(data)
    qr = nil
    size = 7
    while (!qr)
      begin
        qr = RQRCode::QRCode.new(data, :size => size, :level => :l)
      rescue RQRCode::QRCodeRunTimeError
        qr = nil
        size = size + 1
      end
    end
    qr
  end

  def process_template(template_name, output_name, data)
    # Read template
    file = File.open(template_name, "r:UTF-8")
    template = file.read
    file.close()
    # Replace in template
    template.gsub!('${title}', data[:title])
    template.gsub!('${date}', data[:date].strftime("%d.%m.%Y, %H:%M"))
    template.gsub!('${speakers}', data[:speakers].join(', '))
    template.gsub!('${location.name}', data[:location_name].join(", "))
    template.gsub!('${location.address}', data[:location_address].join(", "))
    template.gsub!('${location.geo}', data[:location_geo])
    template.gsub!('${qrcode}', "#{data[:qr_img].to_data_url}")
    for i in 0..5 do
      template.gsub!("${calendar.#{i}}", data[:calendar][i] || "")
    end
    template.gsub!('${abstract}', data[:abstract])
    # Output
    File.open(output_name, 'w:UTF-8') {|f| f.write(template) }
  end

  def svg_to_pdf(svg_name, pdf_name)
    system("inkscape -A #{pdf_name} #{svg_name}")
  end

  def allow_creation(filename)
    if File.exist?(filename)
      puts "Skipping creation of #{filename} (file already exists)"
      false
    else
      true
    end
  end

  def run
    # Check arguments
    if arguments.length<1
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
    # Get output dir
    outputdir = if arguments.length>1
                  Pathname.new(arguments[1])
                else
                  Pathname.new(event.attributes[:filename]).dirname
                end
    # Collect data
    merge_item_location_data(event[:location], self.site.items['/_data/locations/'].attributes)
    calculate_to_date(event)
    self.site.compile
    data = {}
    data[:title] = event[:title]
    data[:date] = event[:startdate]
    data[:speakers] = event[:speakers].map { |s| if s[:affiliation] then "#{s[:name]} (#{s[:affiliation]})" else s[:name] end }
    text = Nokogiri::HTML(event.compiled_content)
    data[:text] = text.content.gsub(/\n+/,"\n")
    data[:location_name] = [event[:location][:name]]
    if (event[:location][:details])
      data[:location_name] << event[:location][:details]
    end
    data[:location_address] = []
    if (event[:location][:strasse])
      data[:location_address] << event[:location][:strasse]
    end
    if (event[:location][:ort])
      if (event[:location][:plz])
        data[:location_address] << "#{event[:location][:plz]} #{event[:location][:ort]}"
      else
        data[:location_address] << event[:location][:ort]
      end
    end
    data[:location_geo] = if (event[:location][:lon])
                     "N #{event[:location][:lon]} E #{event[:location][:lat]}"
                   else
                     ""
                   end
    data[:abstract] = text.text
    calendar_items = self.site.items.select do |i|
      (i[:kind]=='event') && (i[:startdate].to_datetime>event[:startdate].to_datetime) && !i.identifier.start_with?('/_data/stammtisch/')
    end.sort { |a,b| a[:startdate].to_datetime <=> b[:startdate].to_datetime }
    data[:calendar] = calendar_items[0..5].map do |i|
      if i[:startdate].instance_of?(Date)
        "#{i[:startdate].strftime("%d.%m.%Y")}: #{i[:title]}"
      else
        "#{i[:startdate].strftime("%d.%m.%Y, %H:%M")}h: #{i[:title]}"
      end
    end
    # Generate qr code
    vevent = []
    vevent << "BEGIN:VEVENT"
    vevent << "SUMMARY:#{event[:title]}"
    vevent << "DTSTART:#{event[:startdate].getutc.strftime("%Y%m%dT%H%M%SZ")}"
    vevent << "DTEND:#{event[:enddate].getutc.strftime("%Y%m%dT%H%M%SZ")}"
    vevent << "LOCATION:#{data[:location_name].join(", ")}"
    vevent << "DESCRIPTION:Weitere Infos: #{site.config[:base_url]}#{event.path()}"
    vevent << "END:VEVENT"
    data[:qr_img] = get_qr(vevent.join("\n")).to_img
    # Filenames
    presse_txt = (outputdir + '_presse.txt').to_s
    aushang_svg = (outputdir + '_aushang.svg').to_s
    flyer_svg = (outputdir + '_flyer.svg').to_s
    aushang_pdf = (outputdir + 'aushang.pdf').to_s
    flyer_pdf = (outputdir + 'flyer.pdf').to_s
    # Write press txt
    if allow_creation(presse_txt)
      process_template(self.site.items['/_data/presse/'].raw_filename(), presse_txt, data)
    end
    # Write svgs
    if allow_creation(aushang_svg)
      process_template(self.site.items['/_data/aushang/'].raw_filename(), aushang_svg, data)
    end
    if allow_creation(flyer_svg)
      process_template(self.site.items['/_data/flyer/'].raw_filename(), flyer_svg, data)
    end
    # Create pdfs
    if allow_creation(aushang_pdf)
      svg_to_pdf(aushang_svg, aushang_pdf)
    end
    if allow_creation(flyer_pdf)
      svg_to_pdf(flyer_svg, flyer_pdf)
    end
  end
end

runner CreateFlyer

