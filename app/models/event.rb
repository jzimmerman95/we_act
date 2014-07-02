class Event < ActiveRecord::Base
	has_and_belongs_to_many :users
	belongs_to :admin, :classname => "User", :foreign_key => "admin_id"
end