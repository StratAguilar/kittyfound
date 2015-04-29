class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.integer "user_id"
    	t.integer "post_type", :default => 0, :null => false # lost => 0, found => 1 
    	t.string "title", :limit => 60, :null => false
    	t.text "description", :limit => 500, :null => false
      t.string "county", :limit => 50, :null => false, :default => 'Orange County'
      t.string "state", :limit => 50, :null => false, :default => 'CA'
    	t.string "city", :limit=> 50 
    	t.boolean "expired", :default => false, :null => false
    	t.date "date"  #date found or date lost	
      t.attachment "image"
      t.string "cat_breed", :limit => 50
      t.string "cat_color", :limit => 50 #black => 0, grey => 1, white =>2, blue => 3, orange => 4, brown => 5, red => 6
      t.integer "cat_size" #under 8lbs => 0, over 8lbs => 1
      t.integer "cat_age" #adult => 0, kitten => 1, senior => 2
      t.integer "cat_coat" #short => 0, long => 1,  semi-long => 2, hairless => 3
      t.integer "pattern" #solid => 0, white spotted => 1, tabbies => 2, calico => 3, tortoise shell tabby=> 4
      t.integer "cat_sex" #male => 0, female => 1


      t.timestamps null: false
    end
    add_index("posts", "user_id")
  end
end
