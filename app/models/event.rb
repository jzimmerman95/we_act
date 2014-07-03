class Event < ActiveRecord::Base
	has_many :memberships
	has_many :users, :through => :memberships
	belongs_to :admin, :class_name => "User"
end