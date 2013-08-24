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


def latest_articles(max=nil)
  @cache_latest_art ||= @site.items.select do |p|
    p.attributes[:kind] == 'article'
  end.sort do |a, b|
    a.attributes[:created_at] <=> b.attributes[:created_at]
  end.reverse
  @cache_latest_art[0..(max ? max-1 : @cache_latest_art.length-1)]
end

