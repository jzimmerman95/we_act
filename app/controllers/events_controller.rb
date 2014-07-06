class EventsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_event, only: [:edit, :update, :show]

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params.merge({:admin_id => current_user.id}))
		if @event.save
			redirect_to events_path
		else
			render :new
		end
	end

	def edit
  	end

  	def show
  	
  	end


  	def update 
  		@event.update(event_params)
  		redirect_to @event
  	end

	def index
		@events = Event.all
	end

	private

		def set_event
			@event = Event.find(params[:id])
		end

		def event_params
			params.require(:event).permit(:title, :description, :city, :state, :address, :event_time, :picture)
		end
end