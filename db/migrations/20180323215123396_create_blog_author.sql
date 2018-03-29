-- +micrate Up
CREATE TABLE blog_authors (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  slug VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS blog_authors;
