require "./spec_helper"

def blog_hash
  {"name" => "Fake", "slug" => "Fake"}
end

def blog_params
  params = [] of String
  params << "name=#{blog_hash["name"]}"
  params << "slug=#{blog_hash["slug"]}"
  params.join("&")
end

def create_blog
  model = Blog.new(blog_hash)
  model.save
  model
end

class BlogControllerTest < GarnetSpec::Controller::Test
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

describe BlogControllerTest do
  subject = BlogControllerTest.new

  it "renders blog index template" do
    Blog.clear
    response = subject.get "/blogs"

    response.status_code.should eq(200)
    response.body.should contain("Blogs")
  end

  it "renders blog show template" do
    Blog.clear
    model = create_blog
    location = "/blogs/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Blog")
  end

  it "renders blog new template" do
    Blog.clear
    location = "/blogs/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Blog")
  end

  it "renders blog edit template" do
    Blog.clear
    model = create_blog
    location = "/blogs/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Blog")
  end

  it "creates a blog" do
    Blog.clear
    response = subject.post "/blogs", body: blog_params

    response.headers["Location"].should eq "/blogs"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a blog" do
    Blog.clear
    model = create_blog
    response = subject.patch "/blogs/#{model.id}", body: blog_params

    response.headers["Location"].should eq "/blogs"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a blog" do
    Blog.clear
    model = create_blog
    response = subject.delete "/blogs/#{model.id}"

    response.headers["Location"].should eq "/blogs"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
