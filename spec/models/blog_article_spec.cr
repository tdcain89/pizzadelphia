require "./spec_helper"
require "../../src/models/blog_article.cr"

describe BlogArticle do
  Spec.before_each do
    BlogArticle.clear
  end
end
