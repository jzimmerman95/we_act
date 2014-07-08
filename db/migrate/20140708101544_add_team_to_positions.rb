class AddTeamToPositions < ActiveRecord::Migration
  def change
  	add_column :positions, :team_id, :integer
  end
end
