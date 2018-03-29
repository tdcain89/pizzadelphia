div.row
  div.col-sm-11
    h2 Blog Articles
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/blog_articles/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Slug
        th Blog
        th Blog_author
        th Actions
    tbody
      - blog_articles.each do |blog_article|
        tr
          td = blog_article.name
          td = blog_article.slug
          td = blog_article.blog.id
          td = blog_article.blog_author.id
          td
            span
              == link_to("read", "/blog_articles/#{blog_article.id}", class: "btn btn-success btn-xs")
              == link_to("edit", "/blog_articles/#{blog_article.id}/edit", class: "btn btn-success btn-xs")
              == link_to("delete", "/blog_articles/#{ blog_article.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
