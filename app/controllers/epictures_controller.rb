class EpicturesController < ApplicationController

	def create

		@event = Event.find(params[:event_id])
		@epicture = Epicture.new(:picture => params[:event][:picture])
		@epicture.save
		@event.epictures << @epicture
		redirect_to events_path
	end
end