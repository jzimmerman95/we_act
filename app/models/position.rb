class Position < ActiveRecord::Base
	has_many :memberships
	belongs_to :team


end