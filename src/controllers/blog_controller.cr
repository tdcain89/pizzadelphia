class BlogController < ApplicationController
  def index
    blogs = Blog.all
    render("index.slang")
  end

  def show
    if blog = Blog.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Blog with ID #{params["id"]} Not Found"
      redirect_to "/blogs"
    end
  end

  def new
    blog = Blog.new
    render("new.slang")
  end

  def create
    blog = Blog.new(blog_params.validate!)

    if blog.valid? && blog.save
      flash["success"] = "Created Blog successfully."
      redirect_to "/blogs"
    else
      flash["danger"] = "Could not create Blog!"
      render("new.slang")
    end
  end

  def edit
    if blog = Blog.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Blog with ID #{params["id"]} Not Found"
      redirect_to "/blogs"
    end
  end

  def update
    if blog = Blog.find(params["id"])
      blog.set_attributes(blog_params.validate!)
      if blog.valid? && blog.save
        flash["success"] = "Updated Blog successfully."
        redirect_to "/blogs"
      else
        flash["danger"] = "Could not update Blog!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Blog with ID #{params["id"]} Not Found"
      redirect_to "/blogs"
    end
  end

  def destroy
    if blog = Blog.find params["id"]
      blog.destroy
    else
      flash["warning"] = "Blog with ID #{params["id"]} Not Found"
    end
    redirect_to "/blogs"
  end

  def blog_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:slug) { |f| !f.nil? }
    end
  end
end
