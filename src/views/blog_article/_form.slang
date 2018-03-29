- if blog_article.errors
  ul.errors
    - blog_article.errors.each do |error|
      li = error.to_s

== form(action: "/blog_articles/#{blog_article.id.to_s}", method: blog_article.id ? :patch : :post) do
  == csrf_tag
  div.form-group
    == text_field(name: "name", value: blog_article.name, placeholder: "Name", class: "form-control")
  div.form-group
    == text_field(name: "slug", value: blog_article.slug, placeholder: "Slug", class: "form-control")
  div.form-group
    == label(:blog)
    == select_field(name: "blog_id", collection: Blog.all.map{|blog| [blog.id, blog.id]}, selected: blog_article.blog_id, class: "form-control")
  div.form-group
    == label(:blog_author)
    == select_field(name: "blog_author_id", collection: BlogAuthor.all.map{|blog_author| [blog_author.id, blog_author.id]}, selected: blog_article.blog_author_id, class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/blog_articles", class: "btn btn-default btn-xs")
