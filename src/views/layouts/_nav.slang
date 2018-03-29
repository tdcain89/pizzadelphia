- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/blogs" ? "active" : ""
a class="nav-item #{active}" href="/blogs" Blogs
- active = context.request.path == "/blog_authors" ? "active" : ""
a class="nav-item #{active}" href="/blog_authors" Blog Authors
- active = context.request.path == "/blog_articles" ? "active" : ""
a class="nav-item #{active}" href="/blog_articles" Blog Articles
- if (current_user = context.current_user)
  a.nav-item.pull-right href="/signout"
    | Sign Out
  - active = context.request.path == "/profile" ? "active" : ""
  a class="nav-item #{active} pull-right" href="/profile"
    == current_user.email
- else
  - active = context.request.path == "/signup" ? "active" : ""
  a class="nav-item #{active} pull-right" href="/signup"
    | Sign Up
  - active = context.request.path == "/signin" ? "active" : ""
  a class="nav-item #{active} pull-right" href="/signin"
    | Sign In
