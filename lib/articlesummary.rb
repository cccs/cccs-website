require 'nokogiri'

def article_summary(item, separator=/<!-- *more *-->/)
  # Has intro attribute? Use this
  if (item[:intro] && item[:intro].length>0)
    return parse_markdown(item[:intro])
  end
  # Try to extract marked teaser from article
  summary,body = item.compiled_content.split(separator)
  if (body)
    return summary
  end
  # Else: Extract first top level html element
  doc = Nokogiri::Slop(item.compiled_content)
  return doc.children[0].to_html
end
