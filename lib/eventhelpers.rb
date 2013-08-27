def get_events()
  items.select { |i| (i[:kind]=='event') && i.identifier.start_with?('/events') }
end

def generate_event_pages()
  articles = get_events()
  generate_yearly_archive(articles, :startdate, '/events', 'Veranstaltungen des CCC Stuttgart', 'event_archive')
end

def get_activities()
  items.select { |i| (i[:kind]=='event') && i.identifier.start_with?('/activities') }
end

def generate_activity_pages()
  articles = get_activities()
  generate_yearly_archive(articles, :startdate, '/activities', 'Aktionen und Aktivitäten', 'event_archive')
end

def get_regulars_tables()
  items.select { |i| (i[:kind]=='event') && i.identifier.start_with?('/_data/stammtisch/') }
end

def get_public_events()
  items.select { |i| (i[:kind]=='event') && i[:public] }
end

