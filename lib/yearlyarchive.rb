require 'ostruct'

def generate_yearly_archive(articles, date_attribute, basepath, title, templatename = 'article_archive', attributes = {})
  today = Time.now
  currentyear = today.year
  yearmap = articles.group_by { |item| item[date_attribute].year }
  if !yearmap.has_key?(currentyear)
    yearmap[currentyear] = []
  end
  yearlist = yearmap.keys.sort
  yearlist.each_index { |i|
    year = yearlist[i]
    yearmap[year].sort! { |a,b| b[date_attribute].to_datetime <=> a[date_attribute].to_datetime }
    pastfuture = yearmap[year].partition { |a| a[date_attribute].to_datetime > today.to_datetime }
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
      attributes.merge({ :title => "#{title} #{year}", :kind => "page", :futureitems => pastfuture[0], :pastitems => pastfuture[1] }),
      "#{basepath}/#{year}/")
  }
end
