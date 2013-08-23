def projects_by_state()
  @cache_projects ||= items.select { |i| i[:kind] == 'project' }.sort_by { |i| i[:title] }
  @cache_projects_by_state ||= @cache_projects.group_by { |item| item[:status] }
  @cache_projects_by_state
end

def project_id(project)
  project.identifier.split('/')[2]
end
