require 'ostruct'

def generate_archive_pages()
#  articles = items.select { |i| i[:kind] == 'article' }.
#    sort { |a,b| b[:created_at] <=> a[:created_at] }
#  articles = sorted_articles
  articles = items.select { |i| i[:kind] == 'article' }
  yearmap = articles.group_by { |item| item[:created_at].year }
#  yearmap.keys.sort.each { |year|
#    puts "#{year} --> #{yearmap[year]}"
#  }
  yearmap.keys.each { |year|
    # Simplified assumption: At least one blog post each year
    linkprev = if (year>yearmap.keys.min)
      ", :linkprev => OpenStruct.new(:title => #{year-1}, :link => '/archives/articles/#{year-1}/')"
    else
      ""
    end
    linknext = if (year<yearmap.keys.max)
      ", :linknext => OpenStruct.new(:title => #{year+1}, :link => '/archives/articles/#{year+1}/')"
    else
      ""
    end
    @items << Nanoc::Item.new(
      "<%= render 'article_archive', :year => #{year} #{linkprev} #{linknext} %>",
      { :title => "Blogarchiv #{year}", :kind => "fullpage" },
      "/archives/articles/#{year}/")
  }
end
