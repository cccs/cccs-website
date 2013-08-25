def generate_archive_pages()
  articles = items.select { |i| i[:kind] == 'article' }
  generate_yearly_archive(articles, :created_at, '/archives/articles', 'Blogarchiv')
end
