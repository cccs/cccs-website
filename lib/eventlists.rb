def expand_event_list(itemId, defaultTitle = nil, skipIfDatePresent = false)
  @items[itemId][:events].each_with_index do |event,n|
    if (!skipIfDatePresent || !@items.any?{ |i| conv_tz(i[:startdate])==conv_tz(event[:startdate]) })
      metadata = {
        :title => defaultTitle,
        :public => true
      }
      metadata.merge!(event)
      metadata[:kind]='event'
      @items << Nanoc::Item.new("<%= render 'event_body' %>", metadata, "#{itemId}#{n}/")
    end
  end
end

