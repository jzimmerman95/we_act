class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :join, :edit, :update, :new]
	before_action :set_event, only: [:edit, :update, :show, :join]

	def new
		@event = Event.new
	end

	def create

		@event = Event.new(event_params.merge({:admin_id => current_user.id}))
		@event.status = 0
		if @event.save
			#current_user.events << @event
			redirect_to event_path(@event)
		else
			render :new
		end
	end

	def edit
  	end

  	def show
  		@chart = LazyHighCharts::HighChart.new('graph') do |f|
  			f.title(:text => "Population vs GDP For 5 Big Countries [2009]")
  			f.xAxis(:categories => ["United States", "Japan", "China", "Germany", "France"])
			f.series(:name => "GDP in Billions", :yAxis => 0, :data => [14119, 5068, 4985, 3339, 2656])
			  f.series(:name => "Population in Millions", :yAxis => 1, :data => [310, 127, 1340, 81, 65])

			  f.yAxis [
			    {:title => {:text => "GDP in Billions", :margin => 70} },
			    {:title => {:text => "Population in Millions"}, :opposite => true},
			  ]

			  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
			  f.chart({:defaultSeriesType=>"column"})
			end
  	
  	end



  	def success_index
  		@events = Event.where(:status => 1)
  	end

  	def join
  		@event.users << current_user
  		redirect_to @event
  	end

  	def update 

  		#check for completion call
  		if params[:status] 
  			@event.update(:status => params[:status])

  		#otherwise it is a normal edit
  		else
  			@event.update(event_params)
  		end

  		#return to that event
  		redirect_to @event
  	end

	def index
		@events = Event.filter(params[:q], params[:field])
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