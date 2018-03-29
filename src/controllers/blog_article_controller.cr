class BlogArticleController < ApplicationController
  def index
    blog_articles = BlogArticle.all
    render("index.slang")
  end

  def show
    if blog_article = BlogArticle.find params["id"]
      render("show.slang")
    elsif blog_article = BlogArticle.find_by :slug, params["slug"]
      render("show.slang")
    else
      flash["warning"] = "BlogArticle with ID #{params["id"]} Not Found"
      redirect_to "/blog_articles"
    end
  end

  def new
    blog_article = BlogArticle.new
    render("new.slang")
  end

  def create
    blog_article = BlogArticle.new(blog_article_params.validate!)

    if blog_article.valid? && blog_article.save
      flash["success"] = "Created BlogArticle successfully."
      redirect_to "/blog_articles"
    else
      flash["danger"] = "Could not create BlogArticle!"
      render("new.slang")
    end
  end

  def edit
    if blog_article = BlogArticle.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "BlogArticle with ID #{params["id"]} Not Found"
      redirect_to "/blog_articles"
    end
  end

  def update
    if blog_article = BlogArticle.find(params["id"])
      blog_article.set_attributes(blog_article_params.validate!)
      if blog_article.valid? && blog_article.save
        flash["success"] = "Updated BlogArticle successfully."
        redirect_to "/blog_articles"
      else
        flash["danger"] = "Could not update BlogArticle!"
        render("edit.slang")
      end
    else
      flash["warning"] = "BlogArticle with ID #{params["id"]} Not Found"
      redirect_to "/blog_articles"
    end
  end

  def destroy
    if blog_article = BlogArticle.find params["id"]
      blog_article.destroy
    else
      flash["warning"] = "BlogArticle with ID #{params["id"]} Not Found"
    end
    redirect_to "/blog_articles"
  end

  def blog_article_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:slug) { |f| !f.nil? }
      required(:blog_id) { |f| !f.nil? }
      required(:blog_author_id) { |f| !f.nil? }
    end
  end
end
