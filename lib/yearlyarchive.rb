require 'ostruct'

def generate_yearly_archive(articles, basepath, title, templatename = 'article_archive')
  yearmap = articles.group_by { |item| item[:created_at].year }
  yearlist = yearmap.keys.sort
  yearlist.each_index { |i|
    year = yearlist[i]
    linkprev = if (i>0)
      ", :linkprev => OpenStruct.new(:title => '#{yearlist[i-1]}', :link => '#{basepath}/#{yearlist[i-1]}/')"
    else
      ""
    end
    linknext = if (i<yearlist.size-1)
      ", :linknext => OpenStruct.new(:title => '#{yearlist[i+1]}', :link => '#{basepath}/#{yearlist[i+1]}/')"
    else
      ""
    end
    @items << Nanoc::Item.new(
      "<%= render '#{templatename}', :year => #{year} #{linkprev} #{linknext} %>",
      { :title => "#{title} #{year}", :kind => "fullpage" },
      "#{basepath}/#{year}/")
  }
end
