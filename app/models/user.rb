class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
	# has_and_belongs_to_many(:events, :join_table => "users_events")
	acts_as_taggable
	acts_as_taggable_on :categories, :interests


	has_many :memberships
	
	has_many :events, :through => :memberships
	has_many :teams, :through => :memberships
	has_many :positions, :through => :memberships
	
	has_many :created_events, :class_name => 'Event', :foreign_key => :admin_id

	after_create :send_user_create_email

	def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
      end    end
  end

  def profile_pic
    if self.provider == "facebook" && self.uid
      "http://graph.facebook.com/#{self.uid}/picture?type=large"
    end
  end

	protected
		def send_user_create_email
			UserMailer.user_created_email(self).deliver
		end
end