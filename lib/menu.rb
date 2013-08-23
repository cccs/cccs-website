def path_section(item)
  if (item.path=='/') then
    'main'
  else
    item.identifier.split('/')[1]
  end
end

def menu_active_if(ident, cssclasses='')
  if (ident==path_section(item)) then
    " class=\"active #{cssclasses}\""
  else
    " class=\"#{cssclasses}\""
  end
end
