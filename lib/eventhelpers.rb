def get_events(includePlaceholders = false)
  items.select { |i| (i[:kind]=='event') && (i.identifier.start_with?('/events') || (includePlaceholders && i.identifier.start_with?('/_data/platzhalter'))) }
end

def generate_event_pages()
  articles = get_events()
  generate_yearly_archive(articles, :startdate, '/events', 'Veranstaltungen des CCC Stuttgart',
                          'event_archive', { :comingtitle => 'Kommende Veranstaltungen', :pasttitle => 'Vergangene Veranstaltungen' })
end

def get_activities()
  items.select { |i| (i[:kind]=='event') && i.identifier.start_with?('/activities') }
end

def generate_activity_pages()
  articles = get_activities()
  generate_yearly_archive(articles, :startdate, '/activities', 'Aktionen und Aktivitäten',
                          'event_archive', { :comingtitle => 'Kommende Aktionen', :pasttitle => 'Vergangene Aktionen' })
end

def get_regulars_tables()
  items.select { |i| (i[:kind]=='event') && i.identifier.start_with?('/_data/stammtisch/') }
end

def get_public_events()
  items.select { |i| (i[:kind]=='event') && i[:public] }
end

def calculate_to_date(e)
  if e[:duration]
    if e[:startdate].instance_of?(Date)
      if e[:duration] =~ /(\d+)d/
        e[:enddate] = e[:startdate] + ($1.to_i - 1)
      end
    else
      if e[:duration] =~ /(\d+)h/
        e[:enddate] = e[:startdate] + 60*60*$1.to_i
      end
      if e[:duration] =~ /(\d+)m/
        e[:enddate] = e[:startdate] + 60*$1.to_i
      end
    end
  end
end

def calculate_to_dates()
  items.select { |i| (i[:kind]=='event') && i[:duration] }.each do |e|
    calculate_to_date(e)
  end
end

def conv_tz(t)
  if (t && t.class.method_defined?(:utc) && t.utc?)
    Time.local(t.year, t.month, t.day, t.hour, t.min, t.sec)
  else
    t
  end
end

def fix_timezones()
  items.each do |e|
    if e[:created_at] && e[:created_at].instance_of?(Time)
      e[:created_at] = conv_tz(e[:created_at])
    end
    if e[:startdate] && e[:startdate].instance_of?(Time)
      e[:startdate] = conv_tz(e[:startdate])
    end
    if e[:enddate] && e[:enddate].instance_of?(Time)
      e[:enddate] = conv_tz(e[:enddate])
    end
  end
end
