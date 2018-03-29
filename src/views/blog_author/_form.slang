- if blog_author.errors
  ul.errors
    - blog_author.errors.each do |error|
      li = error.to_s

== form(action: "/blog_authors/#{blog_author.id.to_s}", method: blog_author.id ? :patch : :post) do
  == csrf_tag
  div.form-group
    == text_field(name: "name", value: blog_author.name, placeholder: "Name", class: "form-control")
  div.form-group
    == text_field(name: "slug", value: blog_author.slug, placeholder: "Slug", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/blog_authors", class: "btn btn-default btn-xs")
