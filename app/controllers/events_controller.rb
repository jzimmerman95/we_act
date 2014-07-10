class EventsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_event, only: [:edit, :update, :show, :join]

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params.merge({:admin_id => current_user.id}))
		@event.status = 0
		if @event.save
			#current_user.events << @event
			redirect_to events_path
		else
			render :new
		end
	end

	def edit
  	end

  	def show
  	
  	end

  	def success_index
  		@events = Event.where(:status => 1)
  	end

  	def join
  		@event.users << current_user
  		redirect_to @event
  	end

  	def update 
  		@event.update(event_params)
  		redirect_to @event
  	end

	def index
		@events = Event.filter(params[:q])
		if request.xhr? 
      		render :partial => 'events', :layout => nil
    	end
	end

	private

		def set_event
			@event = Event.find(params[:id])
		end

		def event_params
			params.require(:event).permit(:title, :description, :city, :state, :address, :event_time, :picture, :category_list, :status)
		end
end