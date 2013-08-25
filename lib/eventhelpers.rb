def generate_event_pages()
  articles = items.select { |i| i[:kind] == 'event' }
  generate_yearly_archive(articles, :startdate, '/events', 'Veranstaltungen des CCC Stuttgart', 'event_archive')
end

