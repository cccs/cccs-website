def expand_event_list(itemId, defaultTitle = nil)
  @items[itemId][:events].each_with_index do |event,n|
    metadata = {
      :title => defaultTitle,
      :public => true
    }
    metadata.merge!(event)
    metadata[:kind]='event'
    @items << Nanoc::Item.new("<%= render 'event_body' %>", metadata, "#{itemId}#{n}/")
  end
end

