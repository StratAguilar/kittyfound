class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
    	t.string "first_name", :limit => 25
    	t.string "last_name", :limit => 50
    	t.string "email", :default => "", :null => false
    	t.string "phone", :limit => 10
    	t.string "password_digest", :string
    	t.string "type", :limit => 3, :default => "IND", :null => false
      t.timestamps null: false
    end
  end

  def down 
  	drop_table :users
  end
end
