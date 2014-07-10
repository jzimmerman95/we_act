class AddEventToEpictures < ActiveRecord::Migration
  def change
  	add_column :epictures, :event_id, :integer
  end
end
