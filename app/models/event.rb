class Event < ActiveRecord::Base
	has_many :memberships
	has_many :users, :through => :memberships
	belongs_to :admin, :class_name => "User"


	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  	after_create :send_event_create_email



  	protected
		def send_event_create_email
			UserMailer.event_created_email(self).deliver
		end
end