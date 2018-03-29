require "./spec_helper"

def blog_article_hash
  {"name" => "Fake", "slug" => "Fake", "blog_id" => "1", "blog_author_id" => "1"}
end

def blog_article_params
  params = [] of String
  params << "name=#{blog_article_hash["name"]}"
  params << "slug=#{blog_article_hash["slug"]}"
  params << "blog_id=#{blog_article_hash["blog_id"]}"
  params << "blog_author_id=#{blog_article_hash["blog_author_id"]}"
  params.join("&")
end

def create_blog_article
  model = BlogArticle.new(blog_article_hash)
  model.save
  model
end

class BlogArticleControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe BlogArticleControllerTest do
  subject = BlogArticleControllerTest.new

  it "renders blog_article index template" do
    BlogArticle.clear
    response = subject.get "/blog_articles"

    response.status_code.should eq(200)
    response.body.should contain("Blog Articles")
  end

  it "renders blog_article show template" do
    BlogArticle.clear
    model = create_blog_article
    location = "/blog_articles/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Blog Article")
  end

  it "renders blog_article new template" do
    BlogArticle.clear
    location = "/blog_articles/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Blog Article")
  end

  it "renders blog_article edit template" do
    BlogArticle.clear
    model = create_blog_article
    location = "/blog_articles/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Blog Article")
  end

  it "creates a blog_article" do
    BlogArticle.clear
    response = subject.post "/blog_articles", body: blog_article_params

    response.headers["Location"].should eq "/blog_articles"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a blog_article" do
    BlogArticle.clear
    model = create_blog_article
    response = subject.patch "/blog_articles/#{model.id}", body: blog_article_params

    response.headers["Location"].should eq "/blog_articles"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a blog_article" do
    BlogArticle.clear
    model = create_blog_article
    response = subject.delete "/blog_articles/#{model.id}"

    response.headers["Location"].should eq "/blog_articles"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
