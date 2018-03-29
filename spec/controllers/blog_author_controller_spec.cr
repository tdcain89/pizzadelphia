require "./spec_helper"

def blog_author_hash
  {"name" => "Fake", "slug" => "Fake"}
end

def blog_author_params
  params = [] of String
  params << "name=#{blog_author_hash["name"]}"
  params << "slug=#{blog_author_hash["slug"]}"
  params.join("&")
end

def create_blog_author
  model = BlogAuthor.new(blog_author_hash)
  model.save
  model
end

class BlogAuthorControllerTest < GarnetSpec::Controller::Test
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

describe BlogAuthorControllerTest do
  subject = BlogAuthorControllerTest.new

  it "renders blog_author index template" do
    BlogAuthor.clear
    response = subject.get "/blog_authors"

    response.status_code.should eq(200)
    response.body.should contain("Blog Authors")
  end

  it "renders blog_author show template" do
    BlogAuthor.clear
    model = create_blog_author
    location = "/blog_authors/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Blog Author")
  end

  it "renders blog_author new template" do
    BlogAuthor.clear
    location = "/blog_authors/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Blog Author")
  end

  it "renders blog_author edit template" do
    BlogAuthor.clear
    model = create_blog_author
    location = "/blog_authors/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Blog Author")
  end

  it "creates a blog_author" do
    BlogAuthor.clear
    response = subject.post "/blog_authors", body: blog_author_params

    response.headers["Location"].should eq "/blog_authors"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a blog_author" do
    BlogAuthor.clear
    model = create_blog_author
    response = subject.patch "/blog_authors/#{model.id}", body: blog_author_params

    response.headers["Location"].should eq "/blog_authors"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a blog_author" do
    BlogAuthor.clear
    model = create_blog_author
    response = subject.delete "/blog_authors/#{model.id}"

    response.headers["Location"].should eq "/blog_authors"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
