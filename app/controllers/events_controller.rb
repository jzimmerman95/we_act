class EventsController < ApplicationController
	before_action :authenticate_user!

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

	def index
		@events = Event.all
	end

	private

	def event_params
		params.require(:event).permit(:title, :description, :city, :state, :address, :event_time)
	end
end