class BlogArticle < Granite::ORM::Base
  adapter pg
  table_name blog_articles

  belongs_to :blog
  belongs_to :blog_author

  # id : Int64 primary key is created for you
  field name : String
  field slug : String
  timestamps
end
