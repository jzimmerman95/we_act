class AddStatusToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :status, :integer
  end
end
