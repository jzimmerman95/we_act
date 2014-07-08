class Membership < ActiveRecord::Base
	belongs_to :user
	belongs_to :event
	belongs_to :team
	belongs_to :position
	
end
