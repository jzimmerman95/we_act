class CreatePosition < ActiveRecord::Migration
  def change
    create_table :positions do |t|
    	t.string :name
    	t.integer :user_id

    	t.timestamps
    end
  end
end
