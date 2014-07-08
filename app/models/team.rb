class Team < ActiveRecord::Base
	has_many :memberships
	belongs_to :event
	has_many :positions
end
