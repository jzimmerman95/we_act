class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	# has_and_belongs_to_many(:events, :join_table => "users_events")
	has_many :memberships
	
	has_many :events, :through => :memberships
	has_many :created_events, :class_name => 'Event', :foreign_key => :admin_id
end