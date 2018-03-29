div.row
  div.col-sm-11
    h2 Blogs
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/blogs/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Slug
        th Actions
    tbody
      - blogs.each do |blog|
        tr
          td = blog.name
          td = blog.slug
          td
            span
              == link_to("read", "/blogs/#{blog.id}", class: "btn btn-success btn-xs")
              == link_to("edit", "/blogs/#{blog.id}/edit", class: "btn btn-success btn-xs")
              == link_to("delete", "/blogs/#{ blog.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
