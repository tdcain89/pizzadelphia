- if blog.errors
  ul.errors
    - blog.errors.each do |error|
      li = error.to_s

== form(action: "/blogs/#{blog.id.to_s}", method: blog.id ? :patch : :post) do
  == csrf_tag
  div.form-group
    == text_field(name: "name", value: blog.name, placeholder: "Name", class: "form-control")
  div.form-group
    == text_field(name: "slug", value: blog.slug, placeholder: "Slug", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/blogs", class: "btn btn-default btn-xs")
