-- +micrate Up
CREATE TABLE orders (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX order_user_id_idx ON orders (user_id);

-- +micrate Down
DROP TABLE IF EXISTS orders;
