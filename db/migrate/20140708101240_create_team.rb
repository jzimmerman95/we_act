class CreateTeam < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :name
    	t.integer :event_id

    	t.timestamps
    end
  end
end
