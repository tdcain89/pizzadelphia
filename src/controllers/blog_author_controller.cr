class BlogAuthorController < ApplicationController
  def index
    blog_authors = BlogAuthor.all
    render("index.slang")
  end

  def show
    if blog_author = BlogAuthor.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "BlogAuthor with ID #{params["id"]} Not Found"
      redirect_to "/blog_authors"
    end
  end

  def new
    blog_author = BlogAuthor.new
    render("new.slang")
  end

  def create
    blog_author = BlogAuthor.new(blog_author_params.validate!)

    if blog_author.valid? && blog_author.save
      flash["success"] = "Created BlogAuthor successfully."
      redirect_to "/blog_authors"
    else
      flash["danger"] = "Could not create BlogAuthor!"
      render("new.slang")
    end
  end

  def edit
    if blog_author = BlogAuthor.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "BlogAuthor with ID #{params["id"]} Not Found"
      redirect_to "/blog_authors"
    end
  end

  def update
    if blog_author = BlogAuthor.find(params["id"])
      blog_author.set_attributes(blog_author_params.validate!)
      if blog_author.valid? && blog_author.save
        flash["success"] = "Updated BlogAuthor successfully."
        redirect_to "/blog_authors"
      else
        flash["danger"] = "Could not update BlogAuthor!"
        render("edit.slang")
      end
    else
      flash["warning"] = "BlogAuthor with ID #{params["id"]} Not Found"
      redirect_to "/blog_authors"
    end
  end

  def destroy
    if blog_author = BlogAuthor.find params["id"]
      blog_author.destroy
    else
      flash["warning"] = "BlogAuthor with ID #{params["id"]} Not Found"
    end
    redirect_to "/blog_authors"
  end

  def blog_author_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:slug) { |f| !f.nil? }
    end
  end
end
