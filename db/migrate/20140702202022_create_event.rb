class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :title
    	t.text :description
    	t.string :city
    	t.string :state
    	t.string :address
    	t.datetime :event_time
    	t.integer :admin_id

    	t.timestamps
    end
  end
end
