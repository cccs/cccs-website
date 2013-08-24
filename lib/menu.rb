def path_section(item, n=1)
  if (n==1 && item.path=='/') then
    'main'
  else
    sections = item.identifier.split('/')
    if (n<sections.size)
      sections[n]
    else
      ''
    end
  end
end

def menu_active_if(ident, n=1, cssclasses='')
  if (ident==path_section(item, n)) then
    " class=\"active #{cssclasses}\""
  else
    " class=\"#{cssclasses}\""
  end
end
