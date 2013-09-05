def article_base_item(item)
  idparts = item.identifier.split('/')
  articleid = "/#{idparts[1]}/#{idparts[2]}/"
  if idparts.length>3 then
    result = @items[articleid]
    if (!result)
      raise Nanoc::Errors::GenericTrivial.new("Base article #{articleid} for item #{item.identifier} not found!")
    end
    result
  else
    item
  end
end

def pathname_of_article(item)
  idparts = item.identifier.split('/')
  time = item[:created_at]
  slug = idparts[2].sub( %r{^[0-9]*-}, "" )
  time.strftime('%Y-%m-%d') + '-' + slug
end

def sanitize_path(path)
  result = path
  if (!path.start_with?('/'))
    result = '/' + result
  end
  if (!path.end_with?('/'))
    result = result + '/'
  end
  result
end

def latest_articles(max=nil)
  @cache_latest_art ||= @site.items.select do |p|
    p.attributes[:kind] == 'article'
  end.sort do |a, b|
    a.attributes[:created_at] <=> b.attributes[:created_at]
  end.reverse
  @cache_latest_art[0..(max ? max-1 : @cache_latest_art.length-1)]
end

def latest_articles_referred_to(refers_to, max=nil)
  refers_to = sanitize_path(refers_to)
  @site.items.select do |p|
    p.attributes[:kind]=='article' && p.attributes[:refers_to] && sanitize_path(p.attributes[:refers_to])==refers_to
  end.sort do |a, b|
    a.attributes[:created_at] <=> b.attributes[:created_at]
  end.reverse[0..(max ? max-1 : -1)]
end

