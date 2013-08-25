require 'ostruct'

def generate_yearly_archive(articles, basepath, title, templatename = 'article_archive')
  yearmap = articles.group_by { |item| item[:created_at].year }
  yearmap.keys.each { |year|
    # Simplified assumption: At least one blog post each year
    linkprev = if (year>yearmap.keys.min)
      ", :linkprev => OpenStruct.new(:title => #{year-1}, :link => '#{basepath}/#{year-1}/')"
    else
      ""
    end
    linknext = if (year<yearmap.keys.max)
      ", :linknext => OpenStruct.new(:title => #{year+1}, :link => '#{basepath}/#{year+1}/')"
    else
      ""
    end
    @items << Nanoc::Item.new(
      "<%= render '#{templatename}', :year => #{year} #{linkprev} #{linknext} %>",
      { :title => "#{title} #{year}", :kind => "fullpage" },
      "#{basepath}/#{year}/")
  }
end
