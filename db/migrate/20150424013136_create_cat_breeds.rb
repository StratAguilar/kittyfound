class CreateCatBreeds < ActiveRecord::Migration
  def change
    create_table :cat_breeds do |t|
    	t.string "breed", :null => false ,:limit => 30
    	t.string "coat", :limit => 40
    	t.attachment "image"

      t.timestamps null: false
    end
  end
end
