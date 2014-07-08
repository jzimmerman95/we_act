class AddTeamsAndPositionsToMemberships < ActiveRecord::Migration
  def change
  	add_column :memberships, :position_id, :integer
  	add_column :memberships, :team_id, :integer
  end
end
