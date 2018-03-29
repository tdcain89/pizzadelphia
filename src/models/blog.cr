class Blog < Granite::ORM::Base
  adapter pg
  table_name blogs


  # id : Int64 primary key is created for you
  field name : String
  field slug : String
  timestamps
end
