def find_member(name)
  name = name.downcase
  return items.find { |i| i[:kind] == 'member' and (
    i[:title].downcase == name or
    (i[:shortName] and i[:shortName].downcase == name) or
    (i[:aliases] and i[:aliases].map { |a| a.downcase }.include?(name) )
  ) }
end

def member_short_name(member)
  return member[:shortName] || member[:title]
end

def member_link(name, short=true)
  member = find_member(name)
  if member
    shortName = member_short_name(member)
    return "<a href=\"/members/\##{html_escape(shortName)}\">#{short ? shortName : member[:title]}</a>"
  else
    return name
  end
end
