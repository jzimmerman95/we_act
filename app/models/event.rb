class Event < ActiveRecord::Base
	has_and_belongs_to_many(:users, :join_table => "users_events")
	belongs_to :admin, :class_name => "User", :foreign_key => "admin_id"
end