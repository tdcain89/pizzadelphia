-- +micrate Up
CREATE TABLE blog_articles (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  slug VARCHAR,
  blog_id BIGINT,
  blog_author_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  constraint fk_blog_articles_blog foreign key (blog_id) REFERENCES blogs (id),
  constraint fk_blog_articles_blog_author foreign key (blog_author_id) REFERENCES blog_authors (id)
);
CREATE INDEX blog_article_blog_id_idx ON blog_articles (blog_id);
CREATE INDEX blog_article_blog_author_id_idx ON blog_articles (blog_author_id);

-- +micrate Down
DROP TABLE IF EXISTS blog_articles;
