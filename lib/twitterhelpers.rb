def twitter_items()
  @cache_twitter_items ||= items.select { |d| d[:kind] == 'twitter' }
  @cache_twitter_items
end

def twitter_by_date()
  @cache_twitter_by_date ||= twitter_items().sort_by { |d| d[:date] }.reverse()
  @cache_twitter_by_date
end

def twitter_grouped_by_month
  @cache_twitter_grouped_by_month ||= twitter_by_date().group_by { |d| "#{d[:date].year}-%02d" % d[:date].month }
  @cache_twitter_grouped_by_month
end

def tweet_to_html(tweet)
  links = tweet.scan(/https?:\/\/[^ ]*[^ .);:!?]/)
  result = tweet.dup
  links.each_with_index do |link,n|
    result.gsub!(link, "{{{link#{n}}}}")
  end
  result = html_escape(result)
  links.each_with_index do |link,n|
    result.gsub!("{{{link#{n}}}}", "<a href=\"#{link}\">(Link)</a>")
  end
  return result
end

