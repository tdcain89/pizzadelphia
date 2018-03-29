h1 Show Blog
p = blog.name
p = blog.slug
p
  == link_to("back", "/blogs", class: "btn btn-success btn-xs")
  == link_to("edit", "/blogs/#{blog.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/blogs/#{blog.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
