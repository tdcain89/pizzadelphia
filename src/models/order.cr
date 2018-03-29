class Order < Granite::ORM::Base
  adapter pg
  table_name orders

  belongs_to :user

  # id : Int64 primary key is created for you
  timestamps
end
