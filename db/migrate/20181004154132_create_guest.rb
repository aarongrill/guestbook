class CreateGuest < ActiveRecord::Migration[5.2]
 def up
  	create_table :guests do |t|
  		t.string :name
  		t.string :message
  	end
  end

  def down
  	drop_table :guests
  end
end
