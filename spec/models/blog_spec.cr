require "./spec_helper"
require "../../src/models/blog.cr"

describe Blog do
  Spec.before_each do
    Blog.clear
  end
end
