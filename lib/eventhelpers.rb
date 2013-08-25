def get_events()
  items.select { |i| (i[:kind]=='event') && i.identifier.start_with?('/events') }
end

def generate_event_pages()
  articles = get_events()
  generate_yearly_archive(articles, :startdate, '/events', 'Veranstaltungen des CCC Stuttgart', 'event_archive')
end

