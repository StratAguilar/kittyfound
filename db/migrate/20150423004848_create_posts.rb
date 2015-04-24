class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.integer "user_id"
    	t.integer "post_type", :default => 0, :null => false # lost => 0, found => 1 
    	t.string "title", :limit => 60, :null => false
    	t.text "description", :limit => 500, :null => false
    	t.string "city", :limit=> 50
    	t.boolean "expired", :default => false, :null => false
    	t.date "date"  #date found or date lost	
      t.attachment "image"

      t.timestamps null: false
    end
    add_index("posts", "user_id")
  end
end
