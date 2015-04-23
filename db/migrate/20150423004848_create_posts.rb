class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.integer "user_id"
    	t.integer "type", :default => 0, :null => false # lost => 0, found => 1 
    	t.string "title", :limit => 60, :null => false
    	t.text "description", :limit => 500, :null => false
    	t.binary "image" 
    	t.string "location", :limit=> 255
    	t.boolean "expired", :default => false, :null => false
    	t.date "date"  #date found or date lost	

      t.timestamps null: false
    end
    add_index("posts", "user_id")
  end
end
