class Event < ActiveRecord::Base
	acts_as_taggable
	acts_as_taggable_on :categories

	has_many :epictures
	has_many :memberships
	has_many :users, :through => :memberships

	has_many :teams
	belongs_to :admin, :class_name => "User"


	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  	after_create :send_event_create_email

  	def self.filter(query, field)
  		if field == "category"
  			query.blank? ? Event.all : Event.tagged_with("#{query}")
  		else 
			query.blank? ? Event.all : Event.where("#{field} LIKE '%#{query}%'")
		end
	
	end

  	protected
		def send_event_create_email
			UserMailer.event_created_email(self).deliver
		end
end