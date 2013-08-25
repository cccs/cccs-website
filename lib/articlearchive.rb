require 'ostruct'

def generate_archive_pages()
  articles = items.select { |i| i[:kind] == 'article' }
  generate_yearly_archive(articles, '/archives/articles', 'Blogarchiv')
end
