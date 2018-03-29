h1 Show Blog Article
p = blog_article.name
p = blog_article.slug
p = blog_article.blog.id
p = blog_article.blog_author.id
p
  == link_to("back", "/blog_articles", class: "btn btn-success btn-xs")
  == link_to("edit", "/blog_articles/#{blog_article.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/blog_articles/#{blog_article.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
