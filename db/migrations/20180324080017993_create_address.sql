-- +micrate Up
CREATE TABLE addresses (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  constraint fk_addresses_users foreign key (user_id) REFERENCES users (id)
);
CREATE INDEX address_user_id_idx ON addresses (user_id);

-- +micrate Down
DROP TABLE IF EXISTS addresses;
