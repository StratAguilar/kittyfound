class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
    	t.integer "user_id"
    	t.string "name", :null => false, :limit => 50
    	t.string "address_line_1", :null => false, :limit => 50
    	t.string "address_line_2", :limit => 50
    	t.string "city", :null => false,  :limit => 50
    	t.string "zip_code", :null => false, :limit => 11
    	t.string "phone_number", :limit => 10
    	t.string "web_url", :limit => 100

      t.timestamps null: false
    end
    add_index("shelters", "user_id")
  end
end
