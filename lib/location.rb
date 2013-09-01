def merge_item_location_data(location, templates)
  if (location && location[:location])
    # templates = @items['/_data/locations/'].attributes
    if templates[location[:location].to_sym]
      location.merge!(templates[location[:location].to_sym])
    end
  end
end

def merge_location_data()
  items.select { |i| i[:kind] == 'event' }.each { |e| merge_item_location_data(e[:location], @items['/_data/locations/'].attributes) }
end

