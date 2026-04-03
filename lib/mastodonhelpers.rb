def mastodon_items()
  @cache_mastodon_items ||= items.select { |d| d[:kind] == 'mastodon' }
  @cache_mastodon_items
end

def mastodon_by_date()
  @cache_mastodon_by_date ||= mastodon_items().sort_by { |d| d[:date] }.reverse()
  @cache_mastodon_by_date
end

def mastodon_grouped_by_month
  @cache_mastodon_grouped_by_month ||= mastodon_by_date().group_by { |d| "#{d[:date].year}-%02d" % d[:date].month }
  @cache_mastodon_grouped_by_month
end

def mastodon_to_html(post_content)
  # Mastodon liefert bereits fertiges, sicheres HTML direkt aus der API.
  # Manuelles Escaping und Link-Parsing ist nicht mehr notwendig.
  post_content
end

def mastodon_shorten(html, max_length)
  # HTML-Tags entfernen und Zeilenumbrüche durch Leerzeichen ersetzen
  text = html.gsub(/<[^>]+>/, ' ').gsub(/\s+/, ' ').strip
  if text.length > max_length
    text[0...max_length].strip + '...'
  else
    text
  end
end