class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
    	t.integer "post_id"
    	t.string "color", :limit => 20
    	t.string "breed", :limit => 50
    	t.string "size", :limit => 12
    	t.string "coat", :limit => 12
    	t.string "age", :limit => 12
    	t.string "sex", :limit => 8

      t.timestamps null: false
    end
    add_index("cats", "post_id")
  end
end
