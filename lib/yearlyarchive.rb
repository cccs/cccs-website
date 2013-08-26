require 'ostruct'

def generate_yearly_archive(articles, date_attribute, basepath, title, templatename = 'article_archive')
  currentyear = Time.now.year
  yearmap = articles.group_by { |item| item[date_attribute].year }
  if !yearmap.has_key?(currentyear)
    yearmap[currentyear] = []
  end
  yearlist = yearmap.keys.sort
  yearlist.each_index { |i|
    year = yearlist[i]
    yearmap[year].sort! { |a,b| b[date_attribute] <=> a[date_attribute] }
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
      "<%= render '#{templatename}' #{linkprev} #{linknext} %>",
      { :title => "#{title} #{year}", :kind => "page", :archiveitems => yearmap[year] },
      "#{basepath}/#{year}/")
  }
end
