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
