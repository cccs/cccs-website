require 'ostruct'

def split_yearmonth(yearmonth)
  s = yearmonth.split('-')
  month = case s[1]
    when '01'
      'Januar'
    when '02'
      'Februar'
    when '03'
      'März'
    when '04'
      'April'
    when '05'
      'Mai'
    when '06'
      'Juni'
    when '07'
      'Juli'
    when '08'
      'August'
    when '09'
      'September'
    when '10'
      'Oktober'
    when '11'
      'November'
    when '12'
      'Dezember'
  end
  [ s[1], month, s[0] ]
end

def generate_mastodon_archive_pages()
  monthlist = mastodon_grouped_by_month.keys.sort
  monthlist.each_index { |i|
    linkprev = if (i>0)
      ", :linkprev => OpenStruct.new(:title => '#{split_yearmonth(monthlist[i-1])[1]} #{split_yearmonth(monthlist[i-1])[2]}', :link => '/archives/mastodon/#{monthlist[i-1]}/')"
    else
      ""
    end
    linknext = if (i<monthlist.size-1)
      ", :linknext => OpenStruct.new(:title => '#{split_yearmonth(monthlist[i+1])[1]} #{split_yearmonth(monthlist[i+1])[2]}', :link => '/archives/mastodon/#{monthlist[i+1]}/')"
    else
      ""
    end
    @items << Nanoc::Item.new(
      "<%= render 'mastodon_archive', :month => '#{monthlist[i]}' #{linkprev} #{linknext} %>",
      { :title => "Mastodonarchiv #{split_yearmonth(monthlist[i])[1]} #{split_yearmonth(monthlist[i])[2]}", :kind => "fullpage" },
      "/archives/mastodon/#{monthlist[i]}/")
  }
end
