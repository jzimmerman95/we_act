class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	# has_and_belongs_to_many(:events, :join_table => "users_events")
	acts_as_taggable
	acts_as_taggable_on :categories, :interests


	has_many :memberships
	
	has_many :events, :through => :memberships
	has_many :teams, :through => :memberships
	has_many :positions, :through => :memberships
	
	has_many :created_events, :class_name => 'Event', :foreign_key => :admin_id

	after_create :send_user_create_email



	protected
		def send_user_create_email
			UserMailer.user_created_email(self).deliver
		end
end