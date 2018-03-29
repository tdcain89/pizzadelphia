h1 Show Blog Author
p = blog_author.name
p = blog_author.slug
p
  == link_to("back", "/blog_authors", class: "btn btn-success btn-xs")
  == link_to("edit", "/blog_authors/#{blog_author.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/blog_authors/#{blog_author.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
