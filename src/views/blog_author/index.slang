div.row
  div.col-sm-11
    h2 Blog Authors
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/blog_authors/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Slug
        th Actions
    tbody
      - blog_authors.each do |blog_author|
        tr
          td = blog_author.name
          td = blog_author.slug
          td
            span
              == link_to("read", "/blog_authors/#{blog_author.id}", class: "btn btn-success btn-xs")
              == link_to("edit", "/blog_authors/#{blog_author.id}/edit", class: "btn btn-success btn-xs")
              == link_to("delete", "/blog_authors/#{ blog_author.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
